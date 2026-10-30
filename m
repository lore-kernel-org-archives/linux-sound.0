Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351678;
	b=hCh7q9sVnyaZnFxqD2EyQrUq6GOCBLswfTwmbAVavAqnVNluW0IpRXHLFB9wJ5kgHCEv
	 +DPITi8RihfwdTILKuVnf5wXwWxIFtqXFoFTDFeowzSBzp7j8o1fXt5tbCL9wvqVPPe0z
	 ty+zCOcm7WZOC4JWLVuA7wfjbllN4ASMhFEfnpyZV9dQ8Xc5oHjT2kqid0uOtoN18WlGK
	 j3hLm0KyC0kb23LN8gNbOG7cKpHG+DAWUXQGm5XaW12LTyZE8dj+m/OdcehTqZVriT27x
	 J+G2VeD/+7xTeA+HTd2M74+14bDnnTw1LWSIkdzrnh0etsWE7cssd/1ru2RbwievspA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=01Uj7NkgzYwGaJezFr94PPu1LmMCL2796EWK+iXo/l0=;
	b=H3zYpaSRHEpPdrDP5e1imiU+QSOJn7twKkdWgf9EfpN1UXxuso06jfBrR6L0Cg94kQDy
	 nGPiyHKXCuysfASxudEOtbm92h7b97fZ/ODqi2jCn0iqKsgMqfR+UqizRgTQRbiuZVoVH
	 1SKZ3D5VuWUI6KpwklGHqM3FstapbQS5uxvmvlzivJVBtisfEnqA7iT5VjpeHYY8sZ0Tn
	 Sv/aHcbkXnB5pL/8g5B5Irar4zy5t5tUTt54NgEPfNT5xAeU83gXm7pGDOpCik7IGZ6Yx
	 YNYMc0GHy4kFddmyuloaIrWho3xqHhlqSqLiAMEDz3z5Xf4utam2kKn7kO1/pUDdUbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=faDwsTNM;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF3606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CDF3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=faDwsTNM
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso2954775ad.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351678; x=1793956478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=01Uj7NkgzYwGaJezFr94PPu1LmMCL2796EWK+iXo/l0=;
        b=faDwsTNMRY5951Zgwu+PKJrs29viWGALFCGAJAo1ADkElfT7GMMCmFHLPldVP2IDHg
         HoVlcYHokMwqP5kUs7Hzvgtqkgi11Htwy95euLsF/jxP3nVux8FEG5TPMWfGflEJ4Gnf
         La7MZBJ3EAIWx0PGLvxStO0VQ3Boqw/3BqUYRot86v7D6HGz89okW2SDJ139WbCLMhQw
         IPkZbCCS8shXjIGs8247V+nVOyKbi9CUp1/K7E7mYqhwa8L6PT21DttnFlA9V1JJzyrX
         +cyVueUrIYHgmlhcHY+24ZZVEZnuq7nmSaKChyeSG414RRvYKRHJOD5KlLkctLu4c4sK
         ZKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351678; x=1793956478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01Uj7NkgzYwGaJezFr94PPu1LmMCL2796EWK+iXo/l0=;
        b=vfZ/WWRElwLxVED2Wtfnw4ZwqAKXKyrmZhaQkXNNBLUqeOQqLpHfLJZyU4lJ9kmo57
         6T9SMbE1mdJl5EL4veCcjtSvlE4N2gJfxjZ1e5z5ww7yq5i3WWcKk/JqGCtishXMWflm
         aQHWf2C7sDZoUF3QGh+R9UTrQDZGWRM11G/2duWe8PrMLzGYkQGAdApMGPW6XVI9gvSi
         TwzTZt1vVG0M9AiynnTZcryPPmRyZFCd/Myip3TBfqqa8nH0kfUmvlZXgg900X3xM8ds
         sTFr6zsVVaWO15tBiNvMTTLecsgQevC9x9rq7bBbc9O5EPlIAV8N00j5dI2NChez2Dg7
         KrWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPRphMLEIc1UIuzkwUwfUlmLby05ozYBZpZswthnkBMaiI+2kWjinM4ia1dDIIfZrec7cz9qRhy4IvVw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI1rqvtZOOx3p+7ndHzerZxWAuJM/mXRfBzoMoWSVjFVqFCPUNJ
	i9akWhbrnpPnlb9CtZYZu3n8m/bg5JMFIXfTh5v3yI5xwOJIdX1OQ8pm
X-Gm-Gg: AYBFou3Yz7u8G3+0wa8Or8NzrJSW/27VVSv+MF8tw7AqbxQDdCKP0MedtCjfp0xG/A6
	l+iKjjsg5+S+lYj6JDZMYtBU2dn2PDNAnZEj7TLUyv2L0JbyDbb6mRi/ZsW28sN1PugHc6npFY6
	Vs7lJMRTSkAFl9cMNklWITfvuidipLT+1clLGJvTfJaKi++DYLYAo8W1sUWeUJ/AbmdApECFxFa
	+bdsgHwMNyU36zfyJszwpWB9g4BXY12DWXblnkhI4uqXH9xPQR0RRQ3WPdQOlRav/30803eBqS0
	AZzQ+n1kF9DE7l1HbmzhSe/PCHauUFW6sI4MFmdRf4EGbA0mWQ7Bw3V/4woEUMXNvamRy1mpWGZ
	OO6Q9bZI3f8YSdu9XJmJxvODcSd2jUPxWQeapH2nHqeXuvk22mTOIAUIUB1F6zOPpbahNekPbTN
	Hx6K65I7XrLfyCB2z9YkrCdzlYWO/l9LYRGBjxCuAiSi4DnLxmZF3oUqsIgGWRrPGB1OUY9TWrT
	V7uOnpUcoWeiacmrHZSSpmxfxnrTQh+UKcNXCB/eDgB0t9+s2w7NUdlbKxyz/lsmLm7iuBR7Osx
	7IVH09glnfK75aytwXeqcyzL7/YORzhebP4NwqKro1rRUQvsW75jZ5znlcJVvYz4SXp633dcNkU
	JuhmY8KGz38+TAYLWiiuaIW6AvPyCTcZ1i+EH7VM3C7jq
X-Received: by 2002:a17:902:e881:b0:2e9:4d43:d58a with SMTP id d9443c01a7336-2eb36402699mr18501005ad.1.1793351677709;
        Fri, 30 Oct 2026 02:14:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:14:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: fsl_sai: Address several issues in the driver
Date: Fri, 30 Oct 2026 16:13:59 +0700
Message-ID: <20261030091404.18757-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

I've been reviewing the FSL SAI driver and found a few issues
related to error handling and clock management.

This series addresses those issues with several small fixes
and cleanups.

There may be more to look at, but I wanted to send these
changes first.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
  ASoC: fsl_sai: Use optional clock getter for MCLKs
  ASoC: fsl_sai: Remove redundant error messages
  ASoC: fsl_sai: Propagate device tree property read errors
  ASoC: fsl_sai: Drop redundant dataline mask AND

 sound/soc/fsl/fsl_sai.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

-- 
2.43.0

