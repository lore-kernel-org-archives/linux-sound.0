Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676050;
	b=rT+WtDG3/kOpdy8bF/+T/76JtU+5VtHEkeiS0h7ap3wZ3G69nR0mAZOzIlMQNn1UJrZM
	 nVZAivKUhvMXhIZU+nor/D/uOqNl02WHTSVKopG0DafIhlt5AwSnCAW76nhI7LE6QI3OK
	 dHFqI/RAOP0r4pszLstkaA2OA3IM62z3dtMDU4izapyBTWwo/ATNZMdIlOCUgufb/z0Xs
	 b3etd8OugmUDlk/YfYmh77Tlzak8saLePYfCIz47IJKlgc9FUPNTacjZNSMg+dpO/AfyA
	 x+M2ijlxt+QuUfzAcT8sVx9J270CNcXBgrljbWQO1YO8dmHZ9e3mvJ5+HAxBWOXr8+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EwyJCNE1Q7H8bIeTNVXKHO12xLLgxBEZMkKMexqwnPE=;
	b=SiOZggDAVBYurOe2YAsZlIdMWbBzDYdE0gg0emetQAx3KH9mGovMaxfa9ZolbvLvZhr9
	 ZTKOUJwjislgXxGQW+48NWjWz4ryBSgVNSkNUOEhGw3sAu6mt11ThYR7aroYZg+a8RqP2
	 n3LNw4Ww81+/qVSSdQYGwVI9LtqFctnbcq3F+10eBdjPaz2XzPMIRVFtXFpJCwcKZzhH0
	 nZp6cOdlsCnOOliYx2maG+K4vDCHbSvi2lWagDQXN6KOdrWY9tGP9oKoVbzbUQVAqBcMn
	 uzqptbZ6SWuq4CMKUZx82vH0KS3l2Dlcl/KyDHeYqcbgFCuxi8/fFGeEETJFLQOTgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wp+yySQ8;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC26606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 06:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC26606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wp+yySQ8
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-170135e43c7so10376589c88.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 22:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676049; x=1796280849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EwyJCNE1Q7H8bIeTNVXKHO12xLLgxBEZMkKMexqwnPE=;
        b=wp+yySQ8dPkHoU2xelbw26IvuaCNsJXy6YaftZDrhW6c+hXrOBnmoVsOVY9IupjB33
         oJIKHnX5aX7UGHmkeExTnUteVh1iWjSIpCKH9rcJ4YhCaCpQOCZ0Nt2P6HRD3y9Yfmcn
         Wzu1S7FKgPuG2IT0tMTIYtmPlkzgyx5TVvfcj4CyTX/veDcNXFgyzZIdTvAPtc06RSiV
         Nh09Kpbswr8stxH2wAf/cppYWmlTzYaQOey5s7DMsnKyHAYVan1Rjg+Fg/UXkh4Vw2vH
         DMlxgKAJbhMYTPJcYc1zSR7nitEtyUWrTVZG0IKVmgHVwKuT3xCMud5qRaKO3rdnOZy1
         EB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676049; x=1796280849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwyJCNE1Q7H8bIeTNVXKHO12xLLgxBEZMkKMexqwnPE=;
        b=2fYQjCInI7Na/sgh5iwhQUD7b50/TgfRypuBB88fuzOSDpbUj2rwAA3QC89h8+DrrU
         9574gJe+7lJn+94ixsZz6IPQrzd2pFawR6XJfTJXHlGDKyYJ7Ar2GvQ5bkrGZkPCU3SI
         px7SzoirTwp2t8i6oubSqinmdNpsz9i0pABV9IGqWNoXBBhILFk10RGRZo0CXnRR5t8X
         TnB+YsBP++4kMbfN9/BHsQ9LkRsaApZEKQnEAu+O8ZglWTFPbV5eWW4EzoTuM2xA9iXu
         FOS1iOEDDs/4Y+sPnVvk3xXff4Yhc8WGsk2B3cHfy/S+motO1Z7uLFrO2ejVx6yDYumG
         VOzQ==
X-Forwarded-Encrypted: i=1; AL+hErGhdy8dI/nwb8f8mdwyQWJAhXr9pkAZwSZqXc9GNaAjf+VgIouvH7O0x/xUekFf5/R+5aA4ng+xqsoe2Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7/pcs1JqyLmG4rcZxCd5w0JxTZXH5Y+32/TAaDefg90zlBKqo
	Op4BLYMQeQ2UOMrNIMmpV+e/ziHxcTD9S3LKjD/OgA8pERdkX6jyCzgb
X-Gm-Gg: AZFdTZc8oTa7oPZCBg5QRgF8+o1pT1CFcd5BGDwYFDqE6Ebdmhc8BzyrANexuTk0aPy
	YSFciF/iw4qeNRQst0v/LMJsqRC+PElp3ZV9wTHPnCGzhQXbF5HF5gNzj0RTyfwFhJbeoZui5v3
	SF7I1T+695RjBOAF+JdNXxp4HXI2wySRvQ5XZOUEwyZwHYE7Q1t/3OJkv/u+YDTAlf5gUz5Z9xc
	4TG88cNPLvOwE12dY1OpTyWLb7RTBgzCCR4s/udCPxU41uhA7UH92nwLcmIlO2f/w5kfvgJVOlK
	QyvGMz4bQQOsAGObfNY7AJsFM5CyzHudTabu0AsZUy7oitBQ73AdqMIuL7AaQU0+6FxwG0IkJ0h
	LmGUy//bjx677OriZ5ZQfhNLRqtyimgset6dkY/yy/h7nk/hryXtLKmWUMHTZfc2ov7xS9uSWBc
	LIOzzMXVpSm6uMSeiiQm029etelukRG3BgqacBkqc5oNQkzygzdi1w1LHdlaBoC81bluQMmDcIp
	boczC/2rfA7e+JyWJapAXRmZjQU3QiIvhrahBR2pT1Ctcm5kGa9wdMNp4eK9x35t/Bd7i/Ar0AR
	sY082leOjkphI6kAZjsxdAuLoiSeYIJKzuJ8eaOKq+tz5QyhHK0=
X-Received: by 2002:a05:7300:c00f:10b0:381:1eb7:938e with SMTP id 5a478bee46e88-3856c9a61c1mr24744995eec.4.1795676048840;
        Wed, 25 Nov 2026 22:54:08 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm61874754eec.28.2026.11.25.22.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:54:08 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: vmaster: Check follower callback errors
Date: Thu, 26 Nov 2026 06:53:10 +0000
Message-ID: <20261126065310.3451-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Check the return values of follower_get_val() and
follower_put_val() in sync_followers().

Stop synchronization and return the error when either
callback fails.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/vmaster.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index f43144ba2797..88b38ee5ba5f 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -345,17 +345,27 @@ static int sync_followers(struct link_master *master, int old_val, int new_val)
 	struct link_follower *follower;
 	struct snd_ctl_elem_value *uval __free(kfree) =
 		kmalloc_obj(*uval);
+	int err;
 
 	if (!uval)
 		return -ENOMEM;
 	list_for_each_entry(follower, &master->followers, list) {
 		master->val = old_val;
 		uval->id = follower->follower.id;
-		follower_get_val(follower, uval);
+		err = follower_get_val(follower, uval);
+		if (err < 0)
+			goto error;
+
 		master->val = new_val;
-		follower_put_val(follower, uval);
+		err = follower_put_val(follower, uval);
+		if (err < 0)
+			goto error;
 	}
 	return 0;
+
+error:
+	master->val = old_val;
+	return err;
 }
 
 static int master_put(struct snd_kcontrol *kcontrol,
-- 
2.55.0

