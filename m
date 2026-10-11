Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5383C31ED7C
	for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 22:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791757362; cv=none; b=ZRSceVNIzvS/0WwZP1stDyeB1YVNhMoqkijfHfGa3xBbixRnskSHopGs4LMnVOO7Prpsq6QhCn7QBgLwABwZKB7Dxf1JLs+IE/k7qVuuLtuAb2VJ27h1N1qK5AsTPE9/Z9u2lr7qliU+s1MQrbMmxYm9ISwNNt5ASy7gux7gx9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791757362; c=relaxed/simple;
	bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UzfqGx4snj41ghW06OXq8JrDkYlZPOErOtmv5uZJvL5jE6+2LT3Z+g4mfxl8qK4eGsjHwPhK84Zt8IZDJhQs2XPSdCDRH54OoWZq2MECtxFx5JK2AQEKPZ5I3BEH6QBMu2PanuAlBOHWrS0lBFgYv6RijCVrYc512HDEvRO/pAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ug0LVC7V; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ug0LVC7V"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b8306b9f8so3515016d6.3
        for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757360; x=1792362160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=;
        b=Ug0LVC7VrOFkDNMiNM3DBXVcXAhg1cX8nD9c5vpSvhrvN81EFH9qWNfhIc09Fr9jPt
         +0Knqf8guwmKwqzFUPk0C3WXzEq7Zx2MGnX8u/RDnrC2+9dwz9Bjr9TEAJQeZyfXXyOr
         nIs9ebbdOtEthAR1LlL6di0CtrZMG1QphZkhQkbisEdXFa+Ab+LV/RF9tr1fOssrdGZu
         pcf2GBSHsCx3siTyuOB2Le/S2leeT1bXflXMaLexIKs3886CG9Pd+hgtzMRQJ2jtkUDc
         2YcITx7fSoKMT92qCCoo2RJVqfwmQfTJ6tTzRa6jRIuMVEDIALERhrUHNYYjwFDuXYZ/
         mTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757360; x=1792362160;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=;
        b=dzl/Bbtp6Fl0syHd0ZWlxSLKeRXeuc6l8oMX4EMMC1aICnCUhqdnYEtap9waG1MOvx
         JNw0MIGL7VnpDKCOuyNaQJKOL7SnwEAFY7jwSf+qPUOedEninZk1K8UJAe+U/PPAnEX5
         9o2enH9W1HFlsxPiAJPH/eEtA8Bla/pCDpTGOBUJ9iomsT3DL1nb3YYwdnzBxWHEun4y
         Mz1ryOPxsG1Vz0dnv8vHg4M6ngvnpd6myc0vLXz3wVWDLbvFsftUO3E0tThNbiA95bn+
         QOq4c+Nn8RwlAcNfbjDGER8xB9goY0jgpquz1ROLMr72+lN3fw/6eVr7KgCt8KYU3lwI
         qa5g==
X-Gm-Message-State: AFq9FYLwYmks6GUH2BUZJzzmYJz4MDg+HrD5zX/oVfoQM/p8P91q2HyV
	kLFZdZB9UqjbUJ7DD/C0HScOV/sDSaJ8hklff5VVHdEvQa5wwbDwh3k=
X-Gm-Gg: AYBFou3yG9jCFxIO/DB7W9MY6GCzwD+TTBjy8LQUlqnv8j324DUqi3/Olek/xgDFEib
	jh6V5FB+EzNdjWnAkgVrOfnRHOzltEIVBV5SOm2R55dvisRYW+voQTFBrvff6nAeIASG8d++hjf
	CMpgakifHxOpHvXVo2TlbIovZhfvm9c2H6+6Dq8k/4RoICz76/52fDeedig+8vdy8pok8sYArD9
	40r0ucrO4f8pT/4qsj3BaYURQtmX36RTq+bTzbeOFvXFrE3D4ePoc2roh9SBSp4HQUMM6GE5bu+
	T4LhKnztYh/tWT0p/ShzrwWKyAbzXV5oCUJwhib18cytEQoEqkWx3b2JUv7npBNuBDTgtjO9Ab6
	5SkdxJhBOsXZYiVwZgUOo49mmpY/wK/BILtWReXVTDMC0NBJlbhUBztKElqv79yjVOvItRM8jjI
	5sjHFIPu6zyvGkoBLjt8RUkIofPz8K7IIMRCrPENb239glV/GVoMNWDXNp2U+5EuRTh8DENRWZf
	NMkvYGBWmRoRQQ8Gyz22Z8tPOXNTJ9zZbLCE25cGvSZtmARsu2QoaMxCFi0fxcar4j69n1KCJy1
	WlBdIK2wK1XbGhCFx9XwHtU1N8lhoFS4vaTS7uk=
X-Received: by 2002:a05:622a:610f:b0:535:52c:a2e7 with SMTP id d75a77b69052e-5359fb8f85fmr135936341cf.44.1791757360176;
        Sun, 11 Oct 2026 15:22:40 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 0/3] ASoC: mediatek: fix AFE IRQ registration and removal ordering
Date: Sun, 11 Oct 2026 18:22:31 -0400
Message-ID: <20261011222234.2098904-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The AFE IRQ handlers access regmap and PCM state. Register each handler
after its inputs exist and release it before the final remove callback
or managed component teardown releases those inputs. The mt8186 patch
also balances IRQ wake settings on probe failure and removal.

Compile-tested with Clang 22.1.2, W=1 (arm64).
Base: 238650ef6c7c7cca08e032527329424c9fbd70e5

1. ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
2. ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
3. ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime

Assisted-by: LLM
