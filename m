Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F24E4A1E08
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461899; cv=none; b=tS08GnDQxx/ZkKqbZeEKTRBeRPifNAUmaLw7rz5DT4iQ0rmnG7jI79ZEwX+AGgTTwE8QErgjmVu19Qdel1q1bxl/6M1T3ZIQatm5hJGc1vXRQgipeO+CxW2h3H7/XK8xDvTcw39Mt2x4AYlnDLTnhPeJi9fSdHjSldtV/tlERPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461899; c=relaxed/simple;
	bh=qhilQtEwoADWivd3qGD2EWMsOwf7j5yXfD9quboeN04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nm5XaWamgiHHqrQO0qAk6aSPE7bmmj7yxTFPqP5Km2J0XDjeLNhYC0wuZaU4ynShZELCckE02cRPAyk6DwVU09XCYMLE0gL39XrPgPAbvGPBotlbiuxXoIekIKThaGXC8NBkvxWCwhBL9DpIxAErLj54vToZjGFnlcW3OxLW2L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEX0Ec8p; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEX0Ec8p"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so18070a12.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461897; x=1790066697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YAVWjX4Eu+ZHsqxn4+cTrhtGLpr5gbFSdYgLWKGxueI=;
        b=pEX0Ec8phrSYZSwL6J1ld6aPs4I0TE0fNSVvmf/N+sPRPkliqwJsJ+sghd2IUkJ/mZ
         qBYtMpSRPAU2ul9x7aLBSoeNKNAyskWzbBdjqtgB5BIQl1hAxi5WYPcEbwKFaJBhSx2f
         pn5c/nWyjIKLoZ5Zc1JuKvQhLA2W5Ar4OYc3pwPDeJ+KkcAHvGGnLfOy/d+UBol3t9GU
         AOf42ag5m5hBopdYQtFIuoT+wtpNE/bXZBoC/psYl00qXolsdGyeBDOwX/9zvgwK3ilE
         pyObcdmozoQTFWFsZ+6lOzjz/Lvzz8vpVjXdZLsOJWj5wsFTZrszUpIyQyfj5lJ1L2Kz
         d60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461897; x=1790066697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YAVWjX4Eu+ZHsqxn4+cTrhtGLpr5gbFSdYgLWKGxueI=;
        b=zFcCjDgdpDcttjtX84YHGMjvcb6breuj9BsW3e/7DJUIx0IqC36JI7zJi0ObRbcQjh
         fdZMrbT0EgU/F2GHGuhV2vtEQl9valpdnLrJ+cDi5g1RPbeqfdp0bQ5FEatbzKikfqzE
         ugHpWmnkUgUID61yUo9aMjvn8pX52j1NF5GPsfm/uy47cnkz+crwSR0WsKL15sUOt11L
         j4W+hi79svkYesHgvkX+kPuVUR4HfL67/6Wv98vcUzbWM2w7hbcR7ZkzEOK9H0XyTqUd
         l0H6jOTfTn2CI9cBmwM4I7n/37EyWJFh/bsbXjmsCfJAPgfDyRNxjVoy6b2xU6RRd+SD
         2H5A==
X-Gm-Message-State: AFuF++n2fKcuSdqhG6yK3snyZEIHRoNGOv+zGCh4hdz38ExIHAy/wRp9
	1WMaEHTwbXSToGbwUDZPLHT/BxRS0uO5hECyFnE9jwln1uK3FQL1n7rZ
X-Gm-Gg: AYBFou1UD76TEHODV/fulQeFXkpIvF9nakwAwJXbOGZq90E7HTAbfYqu2A3fTGk2g2p
	ceGzXUpL8K4XNHxYpTCuCJeell4Z0mFgs9OoeXpuYRBKEbvpDYLw5vZhxxg1vCGaamrc/XQiaAp
	G1lmcn3SyRFn6R92lzWZM6UWI8CZIRaPeZcFat0POlz+GQUm9REBMBhPTsJxUuAwZ6hKjY39HX6
	biEgSkOyZ7KaaZU2wz6W3o4+N60GYZV4UDvUJyjDYs0lI0anvw5YwWhIEIUppa7VeXYRIH/0WvJ
	781B5lU7hkPOVk5GS6jcXV2SLCqVNZQXo66dpVYnF4UINZs8OAFNCJzobokdyWtqTFkZC8uoYAl
	2gpSoo+tDWemz+xNjup0k/IZ0WS6oXasXtZBgJ7nW3ndl4NFDH8VODGZBP9fOAm4mUiRYqU94IK
	IgzNOvijAhVp1QWJ55njyqiLIAbIF0hyzjunYKKmA6DVLdrufpnP+tbJeM1pVcpyrppG68a1CtE
	Xg7uzsMyYoJ48pVbhp4pdgNDxs=
X-Received: by 2002:a05:6a20:d48c:b0:3da:e50c:5039 with SMTP id adf61e73a8af0-3dd529a4cd9mr485167637.15.1789461897488;
        Tue, 15 Sep 2026 01:44:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 10/23] ALSA: ppc: tumbler: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:11 +0530
Message-ID: <20260915084424.1007757-11-hemanth.selam@gmail.com>
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
 sound/ppc/tumbler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index 139c7b25927a..7ba52e7a24d7 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -1134,7 +1134,7 @@ static long tumbler_find_device(const char *device, const char *platform,
 		gp->active_val = 0x4;
 		gp->inactive_val = 0x5;
 		/* Here are some crude hacks to extract the GPIO polarity and
-		 * open collector informations out of the do-platform script
+		 * open collector information out of the do-platform script
 		 * as we don't yet have an interpreter for these things
 		 */
 		if (platform)
-- 
2.48.1

