Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0E954774;
	Tue,  3 Mar 2026 02:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772503961; cv=none; b=bFrSeAdDaCSthD/rmAuxYmaPPYSBTf8Sk/lS84um9AIhgCNYXHXPx25Ito1e/y1MvcGFA6mZ1cx2/Mj1XPTCMr2+aqT2/YEvAZ1rwYigpew9kxWDMrg+IFdosuI8S58iZbAfV8vEKjJl//zK46s+Ul4heMRwHPxaKEdrvvRLTZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772503961; c=relaxed/simple;
	bh=PvYGG4uG1V+vaE5HnS2sL4PH39gasBgng1x/VlguMMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q6qNyTQ3rfmo/4tBd/nhxn18n1IPiUq/CvV2wQbKyvTHjCtWMOdkn1K/EpWxRLCPBKO3uyj7K+AL7agjyUGCOjczKUb85cL8LRcGofuWH6W+vdXMR2yy1kdwFQl2YJtTMeanW2FjvsCA5EBzpyAU8OdYOOeF9VhClHuQ5wtBcR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6fb3665816a611f1a21c59e7364eecb8-20260303
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:242dd61b-74d7-4c68-b900-a28eef93d653,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.3.11,REQID:242dd61b-74d7-4c68-b900-a28eef93d653,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:c4a3b5df16864846e69fcc629449a6e8,BulkI
	D:260303101234Y9E97IYF,BulkQuantity:0,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|841|850|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil
	,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,
	DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6fb3665816a611f1a21c59e7364eecb8-20260303
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 612985092; Tue, 03 Mar 2026 10:12:31 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] ALSA: hda/intel: Synchronize the module parameter values of the power_save
Date: Tue,  3 Mar 2026 10:11:56 +0800
Message-Id: <20260303021156.136035-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260302081218.771520-1-songxiebing@kylinos.cn>
References: <20260302081218.771520-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

Thanks for your reply, i understand.

On Mon, 02 Mar 2026 16:38:00 +0900, Takashi Iwai <tiwai@suse.com> wrote:
>On Mon, 02 Mar 2026 09:12:18 +0100,
>songxiebing wrote:
>> 
>> In set_default_power_save, if val is 0 and is not assigned to
>> power_save, it leads to incorrect reading of the sys node, resulting in
>> misjudgment, so modify it here.
>> 
>> Signed-off-by: songxiebing <songxiebing@kylinos.cn>
>
>I'm afraid that this can break things in a subtle way, e.g. when there
>are multiple HD-audio controllers, and only one of them is
>blacklisted.
>
>The power_save option is provided as a single knob for simplicity, in
>the case if user wants to change intentionally.  And this doesn't
>guaranteed to be the actual power-saving timeout value that could be
>adjusted also via sysfs.
>
>
>thanks,
>
>Takashi


