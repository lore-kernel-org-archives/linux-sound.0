Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981F51FE45D
	for <linux-sound@vger.kernel.org>; Mon,  2 Dec 2024 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733140368; cv=none; b=RRBpvHjTHkExzUQ+ZQ2TDMxtNV5s9/dzGf1Fh6rT7Pinge9vu9z8wYRKUmWjKlqjt7J/zt/nIcHzmOCEX8t062w33Y+URLVgZ/uf3ke0ZDxXur87vs4m1pjQPCixZVkCAmRnmfpy8oOAp15lt33bvgSnKtafIxy7jQW1yX5tkh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733140368; c=relaxed/simple;
	bh=cfl/exN6c0gUcy+DFliH2JqTC/Neo5JvUUKULKHzl4w=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=se25Npzm92xzGJjlvxT81AgzsbnOwqc1hsxdPutgFN8qxOtBj6b/AIoILcSdEIUQ1t/CPwgVvVPQf+U0rHBldrQRhAnyJFhTKD4Weco/SinxVwKI2KyNEsB5/tvWxxb9/38O7+hw6pt4DWgtyprZUrww0RFHHmA39uik0E81VSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=starfoxfs@gmx.net header.b=p/eMoPbp; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=starfoxfs@gmx.net header.b="p/eMoPbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733140364; x=1733745164; i=starfoxfs@gmx.net;
	bh=cfl/exN6c0gUcy+DFliH2JqTC/Neo5JvUUKULKHzl4w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=p/eMoPbppjnk8ChcFKxPVLgtmzHggyWE5hgbAJZeH3ML3f0msDPetEOgRObJvG+C
	 FxCO5W8XY3m1n3dDmjX+/DVeVN/3I+/4NiJxvVXAqrmg+1nJmRRJF+qx8QIDkRMMc
	 s9fp6jZZPMmdh+JwVT7hhECVG/sj4qE0kBxHZQ9Sme/R6FlVAA3AjjRcnNGHxioKi
	 e0YdK5D3b19+/A9pBefpfMDFSLFwLy3bVjfVanAIRvh2i4wTopgnoGTxavwKUT8Mq
	 R/Xw9WQUuS4PVM0KgaEYorScv79V/CuBpgQeVTgiZVV+dqaKs0jMjbYnbOjELFuVg
	 itXExof5ldqN0+qSJQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.47.38] ([109.250.79.249]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95eJ-1tlzdz2LmJ-014lTn for
 <linux-sound@vger.kernel.org>; Mon, 02 Dec 2024 12:52:44 +0100
Message-ID: <2101e9aa-7675-4619-8f1e-3960f4e4bae1@gmx.net>
Date: Mon, 2 Dec 2024 12:52:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org
Content-Language: en-US
From: Starfox <Starfoxfs@gmx.net>
Subject: Support for Creative Soundblaster AE-9 ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xMAvzxkkZR/ake+20eE3IWUhWejzhklpfToHwYeywJLDBDzyjT2
 YqdQuYqLro3nWkXVlUa047I5Xkg0OoJhX62f3Tvkq2YCGNfunzhHgCs3xggobGxZoNpUkKz
 pQHfKqGDPkumV+iwyyvcOdR5kw+Cef1DvvIxe7X5sO93YVqPc6RHNLCs2coZ23wkSKwgOXN
 dqwjGIFei3dLT6lK1l7Iw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aD2vexbEMzc=;8EUJnGyhe9Gx49cWVSFKBWRClhD
 Ff56NaTUe6UVu3A1R1iFbNJn8QCo+8QoLIlWhtm+rW310ZwpjoynkhVzTin9Ry2DUuUCRJ54w
 5fG2PocCC4AkcyMaXPmlooWkJiy4/XtAutGNv4oMGSWzj4w/I5lnH2hC3/HfL4tbpoIR/ZiCy
 G0WXO1Rtv4c6XQItaRdBiide6RlMfUy+O6fv5w8a2oJrm/odPoypWkid/7wCDdn8J4nYfzqaX
 QZ2pK1UkmsjotFK/Nkf1TrQqWT7TLoJ+OAx954QFttYKWsLGaqkTyKEtsPTOfSknqN+HR8i3W
 fpIQ/W8qAyM2eSoUBtawDKXKciHFwbFij1hKGyyBXu0q9FXDLb1dQZ02R8VvIIG8M1W0jtghr
 zkduOn3h0srMRkQBmHJyhYl5fHjL3//7CmL1ap0G+eh/eueD75+qul38AVFYUQ9SO4+VKIujC
 iIgzkXaK0vzUIbUdMjajBgGu0NhGkVxHVo7E8lLvp8zgVZB+jUNTfpboGdodTQMH8UhzeczEV
 sXvnqfMLiO68sVTs3TFgjSf1TVVqHq/TIYdCZXWgYHfbd2rxH170wNQ1YIZnK0XHlzqJxbCNS
 GscqvGdCg8QFeo13S2vSPc0NjkojZC7Of7kjV6+cEmEoQJyVB+17K/117LVfZM7cYp/5p4pLX
 LTs147oMopoKe49n0x6EY4TeJU4U8FxMjSHqf2DL5kKLwFuEnBaMLLFvMrpEOr96+naY6gQsB
 dd8Rny9/xGrAf5VyjSnIPdUBAzqAROa/ITExxPh8XItrqQhcSsCBmDa223a8o1dU2gPLfyRNp
 bFsE/M0O0MQ/EOxvp5MbgY1gZ+oXqxOEolzNeIGQQy9QzXsiKbRexr1empYNc+EOJJ11QcnVN
 MpKBoz1YHcQDDnU7fUZIlnR+tp2nkQUtmqE4KXbeaj8okXIQlKzJ0Po/uPs5Xlj5MFSEr6jTh
 0G43DZx3fPrNG1S/Hb843kkdQRbQFNc6XXCLVjJy3zYRkoYyJSlRMBEkLFQ4VFFYKOk0CU4fP
 3VdDP99PVDjFPAdSbaq0IwnixUPw3bf0sNhC0hq+UcuGgamvvY8LLNzf8WKYS+kqpS0NTH8Pb
 AtLb4VKJj360CQq3b0bo9avWVwUXOk

Hi Linux Sound Team,

i have switched from Win11 24H2 to Linux Mint 22 Cinnamon Kernel
6.8.0-49-generic

My Hardware Creative Soundblaster AE-9 is not working in Linux Mint, no
sound.

The Creative Card uses the snd_hda_intel driver and the Codec CA0132 and
Creative Generic, i cant get any sound out of the Soundcard nothing
through SPDIF and nothing through Analog Connections.

The ACM Audio Controll Module of this Card wouldn=C2=B4t initialize too.

I have tested around with "PavuControl" Digital Output IEC958 Output set
to SPDIF (no sound and no Digital Data from Soundcard) and Analog Output
Stereo IEC958 -> Output set to Speaker (no sound)

I hope for support because Creative doesn=C2=B4t add any Linux Drivers.

Best Regards,

Thomas




