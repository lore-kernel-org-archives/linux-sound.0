Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601DA1F942;
	Tue, 14 Jul 2026 02:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994857; cv=none; b=Tev56+1VGuG11h5bjl/WAyK4vin8JJckzFykZvnPljvlKBtdkczXjtHqIWkEfcCzMF7Trx8+eXZtuB0JyRCXGarJdSai91AzjI2y5b7QRnwEIl/Mm2BXJ/VSUlloJVvGKhn91iOQakiN88QJclz8M9el5oB7nY+jCOHfMpcfXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994857; c=relaxed/simple;
	bh=h0SYwxkJo19LrXhd/1NdzOEhPvy94f6zKmMnprH124c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rTB5MkoJ4d2i01/3hzul+UMDNRcuTv42KvI8h2OjiZyUAGIXuhJzTePGkf3LjNAtqTyJ0qmn/fojU2yTxab88a+UgHwNsNThhtNOcgi0PNKfkB/3+Je4VRnpRKsfL0qpr7ipf91XcpG10OWPMnY/keh722kPmWUsEs4LIXzTr7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c34c015e7f2811f1aa26b74ffac11d73-20260714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:55c75d52-ec9b-4f7b-8a3a-a9818e6f953f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:4f0481995bd4d5c3f43e1ea5f0377af0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|83|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c34c015e7f2811f1aa26b74ffac11d73-20260714
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1743241300; Tue, 14 Jul 2026 10:07:27 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: Re: [PATCH] ALSA: hda: Check snd_hda_power_pm construct error before executing verb
Date: Tue, 14 Jul 2026 10:07:25 +0800
Message-Id: <20260714020725.309273-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Reply-To: 20260713020427.300628-1-songxiebing@kylinos.cn
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

At present, this patch may cause misjudgment for some platform devices.
If rpm is not enabled on the platform device, the default runtime_status is suspended,
which will result in the inability to write commands properly.

Could you please drop this patch? Sorry for the trouble.

>On Mon, 13 Jul 2026 04:04:27 +0200,
>songxiebing wrote:
>> 
>> From: Bob Song <songxiebing@kylinos.cn>
>> 
>> When userspace writes 1 to /sys/bus/pci/devices/XX/remove to remove HDA PCI device,
>> the codec device enters runtime suspended state early. The snd_hda_power_pm RAII
>> constructor fails to wake up codec, but the original code ignores pm.err and continues
>> to execute hda verb commands. After pci driver remove callback completes, devres
>> automatically iounmap the BAR virtual address bus->remap_addr, resulting in access
>> to invalid unmapped MMIO address and triggering page fault BUG.
>> 
>> Add error check for snd_hda_power_pm constructor result:
>> 1. Detect pm construction failure when HDA core device is suspended;
>> 2. Print warning log with command and error code for debug;
>> 3. Return early to skip subsequent hardware register access, avoid page fault crash.
>> 
>> Signed-off-by: Bob Song <songxiebing@kylinos.cn>
>
>Applied to for-next branch.  Thanks.
>
>
>Takashi
