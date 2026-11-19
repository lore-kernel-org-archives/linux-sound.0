Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074304;
	b=xEaNbtIo5ArGWLbfgdErjEcXOwgGXuiPnrJU1fbYZl39r8iiC9CzTlqIFFOIp22pPdbQ
	 kTETGK5evCLAEE6rhJZFoQgzbOh+hzOmQd8+JVYyiQ1iru8vAsHKLdVqMAl3CFGtUHxGa
	 B8Z3uo7GiuV4+efmXRW5CEbruChpQHSYDDj7xucjwIWXDdhzyBhms1yUPPEadPyhYInXo
	 h4ICLu6nVKMMN0PLEa0O6qi3TxgGX2PJWcD8/NVulFJRFjxk7c/Or/6NMg2WKKEN1SKxD
	 REgNbERnmPX0GZ68PaLZRvkWapVeO0Y4WaFRKEzH8DtvuzcH6dihLGeoiS8ONwvsvHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074304;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FWP1IJXsltuOmQXZn4gACrvdtOB6AkRQPL0EoSGtgRA=;
	b=MNqOwE8axM+a+wls2RqiqBBY+2C2bO3llgJMDPPvmhpahJc72pAvXSkgvrewihLq911s
	 sccDM98gSed7VGc+EEUufMsRe4DwrlytU4g2tqP1xt76bWm2tzGnK6ivdS5MBs4cBgVeN
	 n6H2xXr0Ne5u95BWXV5r4IUYbeA0SecxcSyiZ+n9M6xWmBpxINHsbajiqQRPNtl6Deg/3
	 kTa38SlGW1tnMh8A9xfnV/uw7+s3JQK/eMM1n42aZQAILkn6NCsTuLg3TPrkKv0l29OD4
	 SPwS/2Kp10ELhzgsroZuLjs7qsy9SHmYJ75Dvoa33JRPFR92GAg3VDqdSFgYuhxGFVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C65F606A330;
	Thu, 19 Nov 2026 07:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C65F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1a1a87ace3ed11f19a56ed5b684f684d-20261119
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ea21c517-590d-47d9-88e9-56d7cc68dc7c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:50f61b39150c672178c893b1d939c6a5,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1a1a87ace3ed11f19a56ed5b684f684d-20261119
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1834080256; Thu, 19 Nov 2026 15:44:50 +0800
Message-ID: <266dcc7e-19ec-434e-95b6-9a7356cb620e@kylinos.cn>
Date: Thu, 19 Nov 2026 15:44:47 +0800
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: hda/realtek: Rename Line Out control to
 Headphone on ThinkPad X1 Carbon 6th
To: Jeremy Bryan Smith <helamonster@gmail.com>, linux-sound@vger.kernel.org
Cc: tiwai@suse.de, perex@perex.cz, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <CAAk_qkgY_To5dwBgua8NBpUv7YWB6g1w5b2g6+BzQ5=mqgq6dA@mail.gmail.com>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <CAAk_qkgY_To5dwBgua8NBpUv7YWB6g1w5b2g6+BzQ5=mqgq6dA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeremy,

Thank you for the report and for the precise diagnosis. You are right,
and I'm sorry for the regression -- I introduced it with commit
108704eecab9.

The cause was my oversight of the vendor-level fallback. In
alc269_fixup_vendor_tbl[] there is a catch-all entry:

     SND_PCI_QUIRK_VENDOR(0x17aa, "Lenovo XPAD",
                          ALC269_FIXUP_LENOVO_XPAD_ACPI)

It chains to ALC269_FIXUP_THINKPAD_ACPI, which at
HDA_FIXUP_ACT_PRE_PROBE calls snd_hda_gen_add_mute_led_cdev() and
snd_hda_gen_add_micmute_led_cdev(). Before my commit, 17aa:225c had no
specific entry in alc269_fixup_tbl[], so it fell through to this fallback
and the LEDs were registered. Adding the specific quirk made
snd_hda_pick_fixup() return early with fixup_id already set, so the
vendor fallback was never consulted. ALC285_LENOVO_DAC_RENAME had no
chain, and the LED registration was silently dropped.

Your proposed fix is correct. In sound/hda/codecs/realtek/alc269.c, add
two fields to the ALC285_LENOVO_DAC_RENAME fixup definition:

     .chained = true,
     .chain_id = ALC269_FIXUP_THINKPAD_ACPI,

Keep the rename in alc285_lenovo_dac_rename() at HDA_FIXUP_ACT_BUILD.
The two actions run in different fixup phases, and THINKPAD_ACPI chains
to ALC269_FIXUP_SKU_IGNORE with no cycle.

Since you already found the root cause and have a machine to verify on,
would you like to submit the patch yourself?

If you'd rather not, just say so and I'll submit the fix myself -- no
need to explain. Either way, please include a Fixes: tag pointing to
108704eecab9. If you send it, use your own Signed-off-by and I'll add my
Reviewed-by on the list.

Thanks again for the excellent report.

Regards,
Zhang Heng
