Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9E83EB107;
	Tue, 25 Aug 2026 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649196; cv=none; b=WYaCitGNkqCsRupZdKNwQ/RJcg0SEtvI/afhd5/oWQuYuY+jLtLdyeRDICBUITtKD84+5VyM0wWV1YVg251bZ5S/6jKe/PsHpw3dQIpCX/HfRC0hG7ihqYFC7J8+QuZqFDJZRMk2trN+GP8SQPX0qgKNNrN1Ku6+VClTWxtvRr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649196; c=relaxed/simple;
	bh=Pdg6Z7kok4XFgisdzeOBkEtk4ren90FmNRlkibp25fo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oMD+VJ+mvkoLtyMQ5crWQcuUBulfgMG/f+hrlQBjqr9LQfhR+zu9ycsidEUZ6FrNhjDkOcmL43z/xi7qvPpqlPmbPuxow/aBLPvs/pWl4LUa809J+swO4UuGKXRiyUr7L0ZM+AjMcX6EEkvnSXsdDdDFr1M2mTXfQJvLO1mE1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2f4df9c2a06511f19a56ed5b684f684d-20260825
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c5dc8440-e36e-450d-b0f0-2d1fa3776bb4,IP:0,U
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
X-UUID: 2f4df9c2a06511f19a56ed5b684f684d-20260825
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 132488231; Tue, 25 Aug 2026 17:13:07 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/conexant: Set mic pin VREF to 0x24 on headset mic plug
Date: Tue, 25 Aug 2026 17:13:03 +0800
Message-Id: <20260825091303.1619519-1-songxiebing@kylinos.cn>
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

0x19 is configured as a mic pin, in cx_update_headset_mic_vref, it
executes cx_process_headset_plugin only after confirming that a mic
present is detected. A 4-pole headset is detected as either CTIA or
OMTP and sets 0x24, but the 3-pole mic case is not handled, so a
setting of 0x24 is added here.

>Hmm, it's a headset plug check code, and the fallback case you
>modified was supposed to be a headphone jack, no microphone.  That is,
>the state where a headphone is plugged without microphone into the
>headset jack, and in this case, it's wrong to enable the mic pin --
>you shouldn't be able to record from the mic at all in this particular
>case.
>
>So, there must be other case -- mic-only plug -- and that is where the
>mic pin is set up, too.
>
>
>Takashi
