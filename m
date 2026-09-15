Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A976497B61
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461894; cv=none; b=FJXiqsgduftTUhiidIxJxNVqGNpzoK/gfkgL/UnAhaOKOAAQu45piFrgj3Gy5NA0/AiRmtwbLXYJ8aUVKRjaejvqQjy81T6O/kueYVWN2i4lwfj4+O0J3O9LeqiAxouWfQM30TwchIrcyD1zhIDtD2C6b0EKFH4AN/i4hJttfHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461894; c=relaxed/simple;
	bh=Qt066izirgpsYPfBfGMY6B4fLPUMVYZUV/NPWc3/DmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L47y9JRmkzss5F9cajgWEYDmrLO/73heHP8aMobiF0Z03pXrRDDkljOv8tGH+pZ7AFqE2Tv2rXmGhowECcr1WVAnx+dxNr7haj6YUtgsHVUoLfesnMnA8sVdPKu7gUohrMM+bmvesgx2x1m2s9NbZPZgABGXgEMGRy/gLRnRXqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdX+izX8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdX+izX8"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed1368so29123735ad.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461889; x=1790066689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sspwV7oJ9KHJ/MMj3bvIrsUUHXCJrt1yJQ6IBig6BTU=;
        b=UdX+izX8AniLOVOebgQ/icEbkc3qsiY+wPbwRuERodd+kbTwdf07nH31eUmYAYpG79
         W7N4KF+dWx7Ns8vUeEpayeZJ/ZQyzY4gvEpIjVzhSaGERRUK3liVjJOCMTmTBNVCU1dL
         d+qgS6S5Z6AbKmwPy3EdxgAWqgsnNG3M7VznDxqt6bhd3vX4u5YYUP4Fd8hgmnpQ/TO7
         vv0pwMKdCgrlzT12cILj6qbL3uGgJi+5489ASuK5vz7wYc0Q5KGGf5xGgK48eotsfQrz
         UXOjsifQqA7SDF8bLgcyDHyB9SvbbD7o7RUqqmzR5DPz+naz7Y+0yM+lVI7QvDZy34ja
         Hmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461889; x=1790066689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sspwV7oJ9KHJ/MMj3bvIrsUUHXCJrt1yJQ6IBig6BTU=;
        b=yhG8hwrTEDJZwyD1HGsO/LN5ZVc+0+n0q+dUUEKu4N5sYqPBKWQyA1mIsJvctBTU0p
         If9Tn5K6QWSOdPJXHeTDy+qLWTFK0YXaVxpMup6hcALjdhtmcETE5E9iUCVk1djs9ZPi
         itsm89/xFHiSB/l0GdH1EbFtNwh72cMp+/S2ojPXYjQO3DxSXsxO4xmxJUIpV7wdTHw1
         cmyIwMIDQ1bgTpuR7BV1p8gECIh36MRpLINYm5oqC+3y3gnYJPrLzIaOjdY0U6cCG+G9
         qYE03gqhgvJwgUqJjx0nbNQGBjhlOUcScdM8M6KRNJtemiaT8w8lTY+Zz3xaGLcMws4r
         tBuQ==
X-Gm-Message-State: AFuF++m21YeYjPy2lnmxkpF8mNBYl6B775xVnMwlDG/IsmGLmJTz+nJC
	b6hHg1FlDCLH1U/eCVTSBRBfUR2pl5Wj79zho7p9yEL+7ECwyQDGQzMH
X-Gm-Gg: AYBFou3lyI61/Hex7tWYa4aYWE682Cdttt0b8wZBgpAnDCMYCkXjZlB5IMuSYcHCGvG
	yNuWWXKYELGRkEQSB+TltfAhApK9uTq7wjQ4BzwFoyZs8zBrgGRMeVbexRynFUvx7WY9rawRNfO
	3iE/CGwacWJsNyLavogNCD9bjNbDUsxi/mSeBnTZSBIxlNPTc6hbj19DDPF+0ona+noSoRY7tDN
	co+7610cw9P0qeudeFLNC3cIreioEWpVmkbgfogDQo3DtC0k6fRPUYlH9UrWXsEXEDbs7vVVHnK
	C0jJPJcba7EAft9PVFYaG4HeTxD0PkZpO3eWzAjF8r7rV8j9QWWOocl5WV5sGIqbBK+Si5bkHQe
	U2NVj9UjUG5B87lWg0J6wkKb2ZBv3ESiA6W4vjFz5jYSm1vFYJHxlsag8egtGFCsLWStIDlw9MR
	ramHfJIxSLVCtIuSemGg4+jEIQ8dOERnSpTXvLevjE6qdBaMie/XB23qFs0OXzhWhI29prRZWZ9
	mWc66b6bbTnTBWjdyfcSSiTgQ==
X-Received: by 2002:a17:903:2cf:b0:2db:56da:6a0e with SMTP id d9443c01a7336-2dd6c5f140dmr134979485ad.9.1789461889275;
        Tue, 15 Sep 2026 01:44:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 07/23] ALSA: firewire: bebob: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:08 +0530
Message-ID: <20260915084424.1007757-8-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/firewire/bebob/bebob_hwdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
index 216d1fceb6e7..1c523525fad2 100644
--- a/sound/firewire/bebob/bebob_hwdep.c
+++ b/sound/firewire/bebob/bebob_hwdep.c
@@ -8,7 +8,7 @@
 /*
  * This codes give three functionality.
  *
- * 1.get firewire node infomation
+ * 1.get firewire node information
  * 2.get notification about starting/stopping stream
  * 3.lock/unlock stream
  */
-- 
2.48.1

