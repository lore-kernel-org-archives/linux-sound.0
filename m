Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552411;
	b=GHdRoG1IzqHxdPoVcOt64mCj9BnClClRRMRTrVJJswW9umicdmd6Brs0CENcqAh1K9Q7
	 Jf6O+biQkq3Lmbxt/5bEPz12ZlTOQe5H9EVERbO4eZ1/W/tNL+rda+z0DLc19F+JN56PJ
	 vM7FIIpoPObWXJQukKWmcu0svyjXLCLImPEwvrEe/GPmx2knXRcwzx/2226reo2jLfOn1
	 Ckw/1s0eqmuaCfIFsfotQXfCEf1DGqXRzgVMzdUtTMzDDcK6CRfBu5cxaICSBlx7EVYUY
	 rWnBb5NP2viALLzKvUTFqlknWV/ykshN9tV2OWaj0I4h2gQXsCllaiJxpkDT/fz95KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GTUBLPeqm9O6jPD8kLy/taX+gmnNGDm5WEYH9XnBy0M=;
	b=r7CUvRp5lX8P5G6zIxBu+QwyTfBoOp0YNEgGL40ufNNxH8h76qdL9CDWI2nXYS70U2ig
	 dHkuMSBIXBK8g0LBna3B0uszAOKkrfyNmlaBZ8PavCwRQwPIUpiNr3j3r0Rer9Jb1kSCV
	 Q2qO/OT4rgtX+cHhuvfGAUDPXHKCJ4jcEefZ1X4I+oIVayt+px2a7JrSn0J7Ltk4Yj4wj
	 L+atYgcrDmJ31VM1Q9AaAJJ3XjDg/hiFiNA6x5frSdgJavmYKhMJkzTodw/KqQvs9aIGk
	 NliBc+5RyACEmU2/uW5kHtFam0/sFhjwCb4eq4yUBxThnZECUUmHlsB9EGtNvGsmaMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WT++/oA0";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0746606A338
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 06:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0746606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WT++/oA0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so2697125e9.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 22:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794552409; x=1795157209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GTUBLPeqm9O6jPD8kLy/taX+gmnNGDm5WEYH9XnBy0M=;
        b=WT++/oA0vxnctUW92478QUirej1tXwpX3z2mO4oGFC/lk9QdCKVL71ewazttEdstdz
         DisQtY+tSVq39VuVseV9i591FItGuFQnWR3ojwY2xN75+WB88fReanrjvTcQ4F46Qj3B
         MKgyloNwwjBAILm6KqWQoNSEgobuhfegs+Kf0tr/V5gFiP8RtSKLtMjEmvFlJRqodZW5
         81Lz4Qjt8Rn4WizeCeHOtlnb0ZYjUmi3LBx/AojsSkjP8oW6Iu4nb7LyZClpt8WGvIYA
         0fFSKBtVJaDAcc1wgz/6p1oV4gL5s8b0sDXuQDPocJ0QHJasrBq8ZtM937YMlYHrklFb
         BtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794552409; x=1795157209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GTUBLPeqm9O6jPD8kLy/taX+gmnNGDm5WEYH9XnBy0M=;
        b=UqE0s2LXpph57BzKSdyKDWLnlhxDGKfG0IC2JPx0UA+HLjpAYApl12/qAjf5/jevcl
         6CqWHDF3xZ/cKHWkjyy/wNS1nzAxHsk4oOoMcIA1/TWTqgre+TZ9V6bUBrd1bQhkX6pf
         9+agGO1MQi82dmnqDid5tMlvW1OpqjpXqqyLFipiTWZjE9RrbuJC52k7TErUMppgoIdV
         c4e4C30UwwcUSX9/0fGJVwH3VhMATtIr0v2/+oEpR+sE2W5pAwHUnznrf1tQr+SMCTL2
         DYHIzk/sWCyWcS3XnlIu5/q4uEhP6T2mXnGrzZqVy9bE1AwG2aXCihSODkEGF1oeXtxp
         0okQ==
X-Gm-Message-State: APuU4Z9K9DrVTf3eSNIrs/vFweTmGrZQlw+23Q9vuxPGBG8J5V4Pwz26
	/wgBBlbSLh9uKhIaKfQ9rBnlka/DV4xPcVAmAkXk00MupFx+B69zXOs+/1QwDsMx
X-Gm-Gg: AYBFou2p72m2jGsJ/AoNIaFDsstDQhYbKNjR8P+pMTaNTbdpFFCibikhdIQ+rmlEWAR
	B2D1zIV+XdKJdgXO1CgfDV5+p4FjaN7ySzFcb++81N8nk7xr+Mpj3nnjw59eAFv2+wHveNwBW5S
	lmHRPbJU+xqI98SFNPTAoLCxFKW8XyNa1sM5aWjUYxsop6b1q1//1p1U8iTQ3Hkv2k1sCwF+eLW
	OVAKh9vdTQBUcn3hYPRokcryywasNleOV2LcYmBCNkCQlqLsvfaqjNLdO7zew0kFBCgWv18Ejpu
	uOt/EKBYJweyx5MWcSv6+AAhyjtrasxP5Ni1W03rYcO7GJHgo/NQzodEBUbfu9nvA/p8q0TyEFE
	0rThL8hAtDMBXd7+G+NTDpbk8H+vxdSO9d78+UC8UW8+RTuhqna/qIuckkMY9gWwSDWVOV5sR39
	IX+n3b5Z8QyAIqJKSGBLYz9n3VdYSUp6q8Q6o/yK5nNUDgi+BgGV3z0Ic1qTeFg2XR7yCaHfDV6
	4jud5bj0KxoELUqxnIX3QqXf1vLwxlGXNkIHHxr537iGZtMAFWo+T+/37L+jGs1bDTdpPkbjgR8
	l0k3ets6B8uyhRilcv1XATqfnMJnlE/oCQ==
X-Received: by 2002:a05:600c:548b:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4bb55ab07c6mr30002985e9.35.1794552408980;
        Thu, 12 Nov 2026 22:46:48 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm136496525e9.2.2026.11.12.22.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:46:48 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] ALSA: aw2-alsa: select SND_PCM
Date: Fri, 13 Nov 2026 07:46:14 +0100
Message-ID: <20261113064614.15045-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several stanzas in sound/pci/Kconfig select SND_PCM.
SND_AW2 selects nothing at all.

aw2-alsa calls snd_pcm_new, which sound/core/pcm.c provides under SND_PCM.

  aw2-alsa.c:(.text+0x554): undefined reference to `snd_pcm_new'

4 symbols are undefined in all.

The driver can be built into vmlinux while SND_PCM is a module, in which
case the symbols are not there at link time.

Select rather than depend on: SND_PCM has no prompt of its own and is only
ever enabled by a select, so a depends on would leave SND_AW2
unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_AW2=y and CONFIG_SND_PCM=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 98f2a97f207a ("[ALSA] Emagic Audiowerk 2 ALSA driver.")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/pci/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index 6366f72b3667..9c192d51ff44 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -141,6 +141,7 @@ config SND_AU8830
 
 config SND_AW2
 	tristate "Emagic Audiowerk 2"
+	select SND_PCM
 	help
 	  Say Y here to include support for Emagic Audiowerk 2 soundcards.
 
-- 
2.43.0

