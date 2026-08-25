Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1C57081E;
	Tue, 25 Aug 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651148; cv=none; b=ese79Xn0iqBe4V6Hadn0wx61A1/GbC5gQZZK6BUs9MsSOZMWMA81gkBk9oA6hBeBEWmI02SbZhFKgKGiVNWX2tav8vhNF0Gz42Pu3Z8rWHok1FxyiEBOMfUruAPygIYAhUCmi/MHb+uCAKT3oHB33uP5y1Sohg3VYY7kmEzKEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651148; c=relaxed/simple;
	bh=UYvR66n96sCX40FkyOdGLEQMWFWQCBC6TeGl3QWBDSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ivTOHVyqej7dmVUk6nj2eRZdFcswhbyzgbdz3Af6bR041hflYCOiejDbieCH9wNSg7Afun4DaEXvo931dx+GqEpel58J5Jc/TWEFRZPvpVPyO8eGLyI1jurvyCkqzBT5mBxCNyhujoBjMdSNVTHXDvAFtmzEfRItD2pxyNfSTgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bb8a706aa06911f19a56ed5b684f684d-20260825
X-CID-CACHE: Type:Local,Time:202608251713+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b0250b6e-bba7-4956-97cb-6763b6eed58c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:e7c2806ee06c2e202717796f42f8464d,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|850|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bb8a706aa06911f19a56ed5b684f684d-20260825
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 51326509; Tue, 25 Aug 2026 17:45:40 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/conexant: Set mic pin VREF to 0x24 on headset mic plug
Date: Tue, 25 Aug 2026 17:45:36 +0800
Message-Id: <20260825094536.1718716-1-songxiebing@kylinos.cn>
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

Yes, reading these registers is just to print out debugging information
for problem analysis.

>On Tue, 25 Aug 2026 11:13:03 +0200,
>songxiebing wrote:
>>
>> Hi Takashi,
>>
>> 0x19 is configured as a mic pin, in cx_update_headset_mic_vref, it
>> executes cx_process_headset_plugin only after confirming that a mic
>> present is detected. A 4-pole headset is detected as either CTIA or
>> OMTP and sets 0x24, but the 3-pole mic case is not handled, so a
>> setting of 0x24 is added here.
>
>OK, then you'd need to explain more in the patch description.
>It implies that the patch corrects the debug output, too.
>
>And, this also opens another door: why do we read those registers at
>all?  Now you always set the pin control 0x24 no matter what the
>connection type is.  So the whole headset type detection becomes
>practically moot; it's used only for showing a debug print.
>
>
>thanks,
>
>Takashi
