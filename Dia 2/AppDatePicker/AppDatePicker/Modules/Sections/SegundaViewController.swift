//
//  SegundaViewController.swift
//  AppDatePicker
//
//  Created by Guillermo Rodríguez ALonso on 21/2/24.
//

import UIKit

class SegundaViewController: UIViewController {
    
    //MARK: - Variables locales
    var pickerQuesosArrayData = ["Mozzarella", "Gorgonzola", "Provolone", "Stilton", "Asiago"]
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tituloQuesoLabel: UILabel!
    @IBOutlet weak var detalleQuesoTextView: UITextView!
    @IBOutlet weak var imagenQuesoImageView: UIImageView!
    @IBOutlet weak var seleccionQuesoPickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.seleccionQuesoPickerView.delegate = self
        self.seleccionQuesoPickerView.dataSource = self
        
        self.title = pickerQuesosArrayData[0]
        
        self.tituloQuesoLabel.text = pickerQuesosArrayData[0]
        
        self.detalleQuesoTextView.text = "La mozzarella (en italiano: /mottsa'rɛlla/) o muzzarella (en napolitanoː /muttsa'rɛlla/), o también en castellano mozarela, muzarela, muzarella o musarela, es un queso semisuave, del sur de Italia elaborado tradicionalmente con leche de búfala italiana mediante el método de la pasta hilada, aunque internacionalmente está extendida la elaboración de quesos mozzarelle a base de leche de vaca, encontrándose en Campania y Mediodía como una especialidad tradicional garantizada (ETG), así como con leche de oveja en Cerdeña, los Abruzos y el Lacio. La mozzarella fresca es generalmente blanca, pero cuando se sazona se torna de color amarillo claro dependiendo de la dieta del animal. Debido a su alto contenido de humedad, tradicionalmente se sirve al día siguiente de su elaboración, sin embargo, se puede mantener en salmuera hasta por una semana o más cuando se vende en paquetes sellados al vacío. La mozzarella de baja humedad se puede mantener refrigerada hasta por un mes, aunque la mozzarella rallada con bajo contenido de humedad se vende con una vida útil de hasta seis meses. La mozzarella se usa para la mayoría de los tipos de pizza y varios platos de pasta o se sirve con rodajas de tomate y albahaca en la ensalada caprese."
        
        self.imagenQuesoImageView.image = UIImage(named: pickerQuesosArrayData[0])

    }
    
}

extension SegundaViewController: UIPickerViewDelegate  {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerQuesosArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.title = pickerQuesosArrayData[row]
        self.tituloQuesoLabel.text = pickerQuesosArrayData[row]
        self.imagenQuesoImageView.image = UIImage(named: pickerQuesosArrayData[row])
        
        switch row {
        case 0:
            self.detalleQuesoTextView.text = "La mozzarella (en italiano: /mottsa'rɛlla/) o muzzarella (en napolitanoː /muttsa'rɛlla/), o también en castellano mozarela, muzarela, muzarella o musarela, es un queso semisuave, del sur de Italia elaborado tradicionalmente con leche de búfala italiana mediante el método de la pasta hilada, aunque internacionalmente está extendida la elaboración de quesos mozzarelle a base de leche de vaca, encontrándose en Campania y Mediodía como una especialidad tradicional garantizada (ETG), así como con leche de oveja en Cerdeña, los Abruzos y el Lacio."
            
            
        case 1:
            
            self.detalleQuesoTextView.text = "aunque internacionalmente está extendida la elaboración de quesos mozzarelle a base de leche de vaca, encontrándose en Campania y Mediodía como una especialidad tradicional garantizada (ETG), así como con leche de oveja en Cerdeña, los Abruzos y el Lacio."
            
        case 2:
            self.detalleQuesoTextView.text = "a de quesos mozzarelle a base de leche de vaca, encontrándose en Campania y Mediodía como una especialidad tradicional garantizada (ETG), así como con leche de oveja en Cerdeña, los Abruzos y el Lacio."
            
        case 3:
            self.detalleQuesoTextView.text = " a base de leche de vaca, encontrándose en Campania y Mediodía como una especialidad tradicional garantizada (ETG), así como con leche de oveja en Cerdeña, los Abruzos y el Lacio."
        case 4:
            self.detalleQuesoTextView.text = "a especialidad tradicional garantizada (ETG), así como con leche de oveja en Cerdeña, los Abruzos y el Lacio."
            
        default:
            self.detalleQuesoTextView.text = " así como con leche de oveja en Cerdeña, los Abruzos y el Lacio."
            
        }
    }
    
}

extension SegundaViewController: UIPickerViewDataSource {
    
    // Devuelve el numero de componentes
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Devuelve el numero de filas por componentes
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerQuesosArrayData.count
    }
}
