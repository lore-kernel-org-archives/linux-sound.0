Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3D26E6F4;
	Thu, 18 Dec 2025 02:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766023601; cv=none; b=lPwxPh4qrHZI+Ft93RdMIJNbx1gVzaZrycJ+l5PrM0db9u4TmCDTXqDchzlmheC431Pwm92nt03a1p7tyzw244G7TNRixFzQ1EWsb7Lsz1hm6mwZa7HYZBa3rimVo2t7WO82tu5803rWnIDCrMa3Oww9WP6d+QOECUuGvadfrBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766023601; c=relaxed/simple;
	bh=qEtWuPMaaw/jHO8M2qHyMj/k1p6jq+zcgM8LqnfmeDE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fH7NMwVG4rhdTY1ErT8kxfiv9L55hcbfhIiw+rnNKS0lUh2nYpkoDPREYP8Rdn3fQ1iW9tPEEwO9sbsV9XWzL1wQcgo4OGv9cB6+Q+ZVDG2cGmESU3QliNdyTEjrA9RQ3mP6Rt/WrLR+KmHHO8I2nA9yYIAs9w9t91G1CkIE+ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from SE5P216MB3380.KORP216.PROD.OUTLOOK.COM (unknown [40.104.163.5])
	by APP-03 (Coremail) with SMTP id rQCowACnyN+iYUNp+bINAQ--.18790S2;
	Thu, 18 Dec 2025 10:06:28 +0800 (CST)
From: "vulab@iscas.ac.cn" <vulab@iscas.ac.cn>
To: Mark Brown <broonie@kernel.org>
CC: "shenghao-ding@ti.com" <shenghao-ding@ti.com>, "kevin-lu@ti.com"
	<kevin-lu@ti.com>, "baojun.xu@ti.com" <baojun.xu@ti.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
	=?gb2312?B?u9i4tDogW1BBVENIXSBBU29DOiB0bHYzMjBhaWMzMng0OiBGaXggbWlzc2lu?=
 =?gb2312?B?ZyBlcnJvciBjaGVjayBmb3IgZGV2bV9jbGtfcmVnaXN0ZXIoKQ==?=
Thread-Topic: [PATCH] ASoC: tlv320aic32x4: Fix missing error check for
 devm_clk_register()
Thread-Index: AWItMTAxR0CWxHUEbrPS8dIDaUAC2DFhYjRk8voShsA=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 18 Dec 2025 02:06:22 +0000
Message-ID:
	<SE5P216MB338062940EAC0E6E82C3080FFCA8A@SE5P216MB3380.KORP216.PROD.OUTLOOK.COM>
References: <20251217025051.2196-1-vulab@iscas.ac.cn>
 <d7358b2d-d9c9-4092-8ab4-5b9ba6f29341@sirena.org.uk>
In-Reply-To: <d7358b2d-d9c9-4092-8ab4-5b9ba6f29341@sirena.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowACnyN+iYUNp+bINAQ--.18790S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr45JF18Cw1DZFykGF4Uurg_yoW8GF4rpw
	1DKan5KrsFgw4UCw40g34fGa4UuFW8AF48uwn8GryUAa45WrWIyF4xWFWYqasIkr9akw1F
	vr13W3WxCrWDCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4xvF2IEb7IF0Fy264kE64k0F24l
	FcxC0VAYjxAxZF0Ex2IqxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
	0_Gr1l6VACY4xI67k04243AbIYCTnIWIevJa73UjIFyTuYvjxU2H7KDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUAA2lDUexIoAAAs1

VGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKSSByZWFsaXplZCBJIG1pc3NlZCB0aGUgYnJhY2VzIHsg
fSBmb3IgdGhlIGxvb3AgaW4gdGhlIHByZXZpb3VzIHBhdGNoLCB3aGljaCB3YXMgYSBjcml0aWNh
bCBzeW50YXggZXJyb3IuIEkgd2lsbCBmaXggdGhpcyBpbiB2Mi4KClJlZ2FyZGluZyB0aGUgbGVh
ayBjb25jZXJuOiBUaGUgaGVscGVyIGFpYzMyeDRfcmVnaXN0ZXJfY2xrKCkgaW50ZXJuYWxseSB1
c2VzIGRldm1fY2xrX3JlZ2lzdGVyKCkuIApJZiB0aGlzIGZ1bmN0aW9uIHJldHVybnMgYW4gZXJy
b3IgYW5kIHByb3BhZ2F0ZXMgaXQgdXAgdG8gdGhlIHByb2JlIGZ1bmN0aW9uLCB0aGUgZHJpdmVy
IGNvcmUgc2hvdWxkCmF1dG9tYXRpY2FsbHkgdW5yZWdpc3RlciBhbnkgY2xvY2tzIHN1Y2Nlc3Nm
dWxseSByZWdpc3RlcmVkIGluIHByZXZpb3VzIGxvb3AgaXRlcmF0aW9ucy4KClRoZXJlZm9yZSwg
SSBiZWxpZXZlIGV4cGxpY2l0IHVucmVnaXN0ZXIgaXMgbm90IG5lZWRlZCBoZXJlLApidXQgcGxl
YXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nIHJlZ2FyZGluZyB0aGUgZGV2bSBiZWhhdmlvci4K
Ci0tCldpdGggYmVzdCB3aXNoZXMKSGFvdGlhbiBaaGFuZwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18Kt6K8/sjLOiBNYXJrIEJyb3duCtLRt6LLzTogMjAyNSDE6iAx
MiDUwiAxNyDI1SDQx8bayP0gMTk6NTgKytW8/sjLOiBIYW90aWFuIFpoYW5nCrOty806IFNoZW5n
aGFvIERpbmc7IEtldmluIEx1OyBCYW9qdW4gWHU7IExpYW0gR2lyZHdvb2Q7IEphcm9zbGF2IEt5
c2VsYTsgVGFrYXNoaSBJd2FpOyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcK1vfM4jogUmU6IFtQQVRDSF0gQVNvQzogdGx2MzIwYWljMzJ4
NDogRml4IG1pc3NpbmcgZXJyb3IgY2hlY2sgZm9yIGRldm1fY2xrX3JlZ2lzdGVyKCkKCk9uIFdl
ZCwgRGVjIDE3LCAyMDI1IGF0IDEwOjUwOjUxQU0gKzA4MDAsIEhhb3RpYW4gWmhhbmcgd3JvdGU6
Cgo+ICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGFpYzMyeDRfY2xrZGVzY19hcnJh
eSk7ICsraSkKPiAtICAgICAgICAgICAgIGFpYzMyeDRfcmVnaXN0ZXJfY2xrKGRldiwgJmFpYzMy
eDRfY2xrZGVzY19hcnJheVtpXSk7Cj4gKyAgICAgICAgICAgICBjbGsgPSBhaWMzMng0X3JlZ2lz
dGVyX2NsayhkZXYsICZhaWMzMng0X2Nsa2Rlc2NfYXJyYXlbaV0pOwo+ICsgICAgICAgICAgICAg
aWYgKElTX0VSUihjbGspKQo+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihj
bGspOwoKSWYgYW4gZXJyb3IgZG9lcyBoYXBwZW4gdGhpcyB3aWxsIGxlYWsgYWxsIHRoZSBwcmV2
aW91c2x5IHJlZ2lzdGVyZWQKY2xvY2tzLgo=

