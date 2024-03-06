/*
Copyright, everisSL
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation

protocol SplashInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchDataFromInteractor()
}

final class SplashInteractor: InteractorInterface {
    
    weak var presenter: SplashPresenterInteractorInterface!
    let provider: SplashProviderProtocol = SplashProvider()
    
    private func transformDataViewModel(data: [Card]) -> [DataViewModel] {
        var arrayData: [DataViewModel] = []
        for index in 0..<data.count{
            if let modelData = data[index].data{
                let obj = DataViewModel(pCardType: .deal, pData: self.transformDataToCardViewModel(data: modelData))
                arrayData.append(obj)
            }
        }
        return arrayData
    }
    
    private func transformDataToCardViewModel(data: CardData) -> CardViewModel {
        let modelData = CardViewModel(pDescriptor: data.descriptor ?? "",
                                      pType: data.type ?? "",
                                      pFinePrint: data.finePrint ?? "",
                                      pAnnouncementTitle: data.announcementTitle ?? "",
                                      pImages: self.transformDataToImageViewModel(data: data.images ?? []),
                                      pEndAt: data.endAt ?? "",
                                      pTags: self.transformDataToTagViewModel(data: data.tags ?? []),
                                      pDealUrl: data.dealUrl ?? "",
                                      pGrid4ImageUrl: data.grid4ImageUrl ?? "",
                                      pSidebarImageUrl: data.sidebarImageUrl ?? "",
                                      pHighlightsHtml: data.highlightsHtml ?? "",
                                      pPitchHtml: data.pitchHtml ?? "",
                                      pPriceSummary: self.transformDataToPriceSummaryViewModel(data: data.priceSummary) ?? PriceSummaryViewModel(pValue: PriceViewModel(pFormattedAmount: "")),
                                      pLargeImageUrl: data.largeImageUrl ?? "",
                                      pBadge: self.trasnformDataToBadgeViewModel(data: data.badges ?? []),
                                      pDivision: self.transformDataToDivisionViewModel(data: data.division))
        return modelData
    }
    
    private func transformDataToImageViewModel(data: [Image]) -> [ImageViewModel] {
        var arrayImage: [ImageViewModel] = []
        for item in 0..<data.count {
            let model = ImageViewModel(pUrl: data[item].url ?? "")
            arrayImage.append(model)
        }
        return arrayImage
    }
    
    private func transformDataToTagViewModel(data: [Tag]) -> [TagViewModel] {
        var arrayTags: [TagViewModel] = []
        for item in 0..<data.count {
            let model = TagViewModel(pName: data[item].name ?? "")
            arrayTags.append(model)
        }
        return arrayTags
    }
    
    private func transformDataToPriceSummaryViewModel(data: PriceSummary?) -> PriceSummaryViewModel? {
        if let dataDes = data{
            let model = PriceViewModel(pFormattedAmount: dataDes.price?.formattedAmount ?? "")
            let priceModel = PriceSummaryViewModel(pValue: model)
            return priceModel
        }
        return nil
    }
    
    private func trasnformDataToBadgeViewModel(data: [Badge]) -> [BadgeViewModel] {
        var arrayBadges: [BadgeViewModel] = []
        for item in 0..<data.count {
            let model = BadgeViewModel(pText: data[item].text ?? "", pIconImageUrl: data[item].iconImageUrl ?? "")
            arrayBadges.append(model)
        }
        return arrayBadges
    }
    
    private func transformDataToDivisionViewModel(data: Division?) -> DivisionViewModel {
        DivisionViewModel(plng: data?.lng ?? 0.0, pName: data?.name ?? "", pLat: data?.lat ?? 0.0)
    }
    
}

extension SplashInteractor: SplashInteractorPresenterInterface {
    
    func fetchDataFromInteractor() {
        
        DDBBCoreStack.shared.loadDataIfNeeded { (isRefreshingRequired) in
            if isRefreshingRequired {
                self.provider.fetchData { [weak self] (result) in
                    guard self != nil else { return }
                    DDBBCoreStack.shared.setCuponList(data: self?.transformDataViewModel(data: result.cards ?? []) ?? [])
                    self?.presenter?.getDataFromInteractor(data: self?.transformDataViewModel(data: result.cards ?? []))
                } failure: { (error) in
                    print(error.localizedDescription)
                }
            } else {
                self.presenter?.getDataFromInteractor(data: DDBBCoreStack.shared.getCuponList())
            }
        }
    }
}
