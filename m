Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12742175A61;
	Mon, 23 Mar 2026 03:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774235591; cv=none; b=QSbrSCP0X9FLVVCyb3SeH0IAHtpLMmXwuJ5dreFiYp4Buk7r+YUFxIxGwZBN0U9vFLH+wYAMpri67rx9UKG+eW0s+1vOWMcY6hKGG4/+rNSStT3PP8cysDxVjBaSsdfJscruG2MM99ZH3R4RjHv4gLYpsnOzRGILdtHmpB+xcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774235591; c=relaxed/simple;
	bh=SFLooepHlXM+V1On6X3xEFTFbJk6I3Dpm3d2te8NJto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyCMAMLh1P0rJ0Yj4oFvGXIRbNrtOI/QygT6Zga1jFF48Be3QeCrmJ/gi4PS6diIzlJmKFs7G/bRcbHlionbAJl5B+mgz4m52BUuI0cV40s2Yyj/gs5KYsNH9i+vQqMPa5uZ7nRV4ahQQnDSKkSTqabY9a/RRnRLNwrvF99sbgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 34ef5c82266611f1a21c59e7364eecb8-20260323
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:9592423b-8bfe-452c-b0e3-fdc846773104,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:455f0259728736c0511c39bce01185ba,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|898,TC:nil,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 34ef5c82266611f1a21c59e7364eecb8-20260323
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 160417631; Mon, 23 Mar 2026 11:13:04 +0800
Message-ID: <e2ae2b1f-b058-47d0-9bb6-889044f2af16@kylinos.cn>
Date: Mon, 23 Mar 2026 11:13:01 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: add new quirk for HP OmniBook 7 Laptop
 16-bh0xxx
To: tiwai@suse.com, perex@perex.cz, chris.chiu@canonical.com,
 kailang@realtek.com, sbinding@opensource.cirrus.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Artem S . Tashkinov" <aros@gmx.com>
References: <20260323030503.3988941-1-zhangheng@kylinos.cn>
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <20260323030503.3988941-1-zhangheng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please help me check whether it is more appropriate to add a new quirk
or replace the existing one:

SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2)

with

SND_PCI_QUIRK(0x103c, 0x8e60, "HP OmniBook 7 Laptop 16-bh0xxx",
ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED)

Both the PCI subsystem ID and the HDA subsystem ID are 0x103c8e60.

