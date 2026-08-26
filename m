Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3C31D435F;
	Wed, 26 Aug 2026 01:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787706783; cv=none; b=LcP8eLCyRxQbKNSQJZ6mePHYc/O19N5Bv+fGOALVwztXQWOiiBm5VKPm38zP+GptZ9rdRLBODCKEcIEOxq13lK3sGoD8NZzLUfHdkpH7sWTVyonGK0gKJMBu4cihG5tASK3bSq06WgPPkY07E0zXHRY+X1gJ4gBe3EbuL7/b8+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787706783; c=relaxed/simple;
	bh=Lsc1OtQ9M4W04dX85jSmJ1M4xTzDj/Da6EqRSoADMas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k99z/vCnr35ogXeZVbQl0UCKoyChmE82BPTTsJVObGjJlS+8p/YGBHdsARwOrsO4IfTNWtSg6rsZBv0YsOswCXAZSG8CnTmRk8q8+8wQTFmzF8G4HtxQ97ai/LMummM5gDSbSZ6oZQus6rpS0W1keFWea990rk1vR0kSyzOz27g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 42d99bfaa0eb11f19a56ed5b684f684d-20260826
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c8e68926-e54f-4e53-b76c-46e0e0155050,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:57a0737c1ac9c08310b524f1acd22151,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|850|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 42d99bfaa0eb11f19a56ed5b684f684d-20260826
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1105182439; Wed, 26 Aug 2026 09:12:52 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/conexant: Set mic pin VREF to 0x24 on headset mic plug
Date: Wed, 26 Aug 2026 09:12:48 +0800
Message-Id: <20260826011248.121656-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260825023855.394959-1-songxiebing@kylinos.cn>
References: <20260825023855.394959-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

Thank you very much for your suggestion, but some adjustments are
still needed. Setting 0x24 first will cause headphone type recognition,
which will be executed later. I will provide a second version patch,
thank you.

>Then it's better to move the pin setup to the caller; it makes the
>setup more consistent.  While we're at it, rename the function to be
>more intuitive one.  So the change would be something like below.
>
>
>Takashi
>

>+	} else {
>+		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
>+		cx_process_headset_detect_plug_type(codec);
>+	}
