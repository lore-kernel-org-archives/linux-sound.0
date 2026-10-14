Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF38443C055
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959597; cv=none; b=lt4WqjtL4xwhvjBgK9z+qdmaLN2/3opBAgzu+ga11cjbrXlMGny7QQFbjkeAZgngg0kGWFUk0PqSTW+gKFnkZ1Sc5gXtSssylWueo2pTQJQ/wdPmciJOVynjIgcKoCViPHX3+FmCEfEz/hWZ3mNWXwOmd0ZQnYpSvMn9QMNHmiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959597; c=relaxed/simple;
	bh=1PwR+ODcKHLyd0ZhnaD8thna8oK51MyPxFw7FpxRUUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIRfEIL5MiW4zO/jTjVs55ir1nP3wfQscMaDeisQJNCURHtGgkmJjpNnNiYvQ2MAoiLXZsn1dp+JR57CBDrp5DOe1V67XXqV+FoBYjYH2hbnfW3d9FxPyoQFr7NR1bUObnOb1qFGN15zeIuRJgZAfqWrHw3yGeR7k/LCJUT8Y6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFxMxhAz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFxMxhAz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8d2574fd9so22664565ad.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959587; x=1792564387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0/sxyvqV6AS7JtOxUykkWaTxUCrr096nXX/5CXIozA=;
        b=bFxMxhAzG4ZdMEA3FdPzmszfv/pYxFSxjRYUvEdulUzGAySKbqVbo6EZtt8o6a1S94
         D0Z4tyIHD//BBPXLP7uDBho0yE3TZjfvgPqKh4M4qOWxOxB7p+u2YfUAX4HUzFdHRvca
         o9FLl/gQaqK9ojiMaiuNy3b+KFxrbyFuyl7AgfApRXpowdMirODBxl5LIDN7BqRUYgh9
         zEcL00WlnW2ZOOODB2kB6BP51Nw/6N4Zki9o3sLRa9qdMf8vqmXPcXKMdYVoa7gUzBeF
         /J4EATImUebO8OToc/D66z4SdMav9wt/AR7Sxzyjm1vX0P8+iLl/lVK7reQbf48Y7QOG
         oLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959587; x=1792564387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0/sxyvqV6AS7JtOxUykkWaTxUCrr096nXX/5CXIozA=;
        b=0pgYFRGmRVOH7owufCoJv/JXXkrlQ7ahRV1TMgk7omZBNCjUffJlX6RRElf0462T3y
         nT8iF3lGaUuyA+HzedCzszgJunmmhv3JwKWCs07NFLrHSJBDTJuKbbn2e8f0/GBsGV9t
         W1gHDWbKyfOQGemm1Ltn5A6liu/yA8rxKAdWpaC8ZhGZdiKE6dC7noioyKmTltMaqLXP
         OZ9L3l4w8frU9z51IQSjTGYN/aL/rl6A3ed7YvRh6sMbcTEYGurnMOSgouYjiexZ726Q
         KIWrTG6vfSu+xYUwAfnSzpnSady3t4+BxzRVBoYr5IppBOyD0A9j7JcXrkXux2qf6+z/
         3lcg==
X-Forwarded-Encrypted: i=1; AKwUvBzteu64nLIbeg7f/YNJLinbUaPjRPxuhfUpS8K5N6ZQhVqPWqM34bVP2FxzyoPJddmL/1otPTXwRKMDDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqaygv/MvPwU4v0EcxxkKiT1LKJuw2hih8+6oSXJR0Vmc/8qpY
	X3cDkVne9wNhNiptNPI++wSmSQZ/oj+JwgrmQvRywBdsT7Ic2qhky4iM
X-Gm-Gg: AYBFou3hYumcuWNMX+RbwBKNPEq26Rw735D++sbNBrx/Bljsb8OUfNQe08H1NzUoveb
	6+rHiSNtw4OBTphmltvKrdDwkIcmdx+tPQyGeM2eO0s6e0LZGdF5eVvQz3/2D8bEbEj5cKWouCW
	yeHlQszNoqj5BQ2moru2a7JI5eqQCC5nuHbmk7U6fScR3azq+fc4Mk9toGvrR3EHb+5KSfZRhnO
	2G4E23EnLevnwipDHJpt0ijpyvzOOKf+MhVtKpPjKLMfwvktplgVVcDLQ9ZO18hYwWtiL/Q7UU1
	AKZ5oR2o2+G0JN7ZVervnPC/EOjq+n0/P7eePCYwU7mZx03qiR1JXrOG851A85AIaW141NfWA7M
	ME+35ZJkNzZjfwztqre+1D+lHCuBcc1AoL2wkNXIBLyhd4nXcqtVKkRMaDYRdIicKMrIiHR7YHv
	MMzTWy+T7ba+63oGwUD2uZ/OOF08tpZ0+ciwUSr43JfDq++Ighlv/Nh0CtqY3o7CSQMqtTDU05p
	5A0D+QonMVl+U6NqIz+AkhD+JCMmO4OSSP6dmEL8XIknFmIWTSTd/OLtMmEAD/2W29ZJLhd+4I=
X-Received: by 2002:a17:90a:c2cc:b0:3ab:c80:9364 with SMTP id 98e67ed59e1d1-3ab3a98f487mr13050367a91.32.1791959586774;
        Tue, 13 Oct 2026 23:33:06 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:06 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] ASoC: codecs: wm8955: Fix definition of Treble Cutoff control
Date: Wed, 14 Oct 2026 15:32:35 +0900
Message-ID: <b398bc6dcf8dc2b93504608cdf952823ca238cd5.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Treble cutoff (TC) is at bit 6 of Treble Control, not at bit 2, which
is part of the treble volume (TRBL[3:0]).

Fixes: 54db41c116c3 ("ASoC: wm8955: Use SOC_ENUM_SINGLE_DECL()")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8955.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index c897a9ab764d..d872d4e00529 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -426,7 +426,7 @@ static const char *treble_cutoff_text[] = {
 	"High", "Low"
 };
 
-static SOC_ENUM_SINGLE_DECL(treble_cutoff, WM8955_TREBLE_CONTROL, 2,
+static SOC_ENUM_SINGLE_DECL(treble_cutoff, WM8955_TREBLE_CONTROL, 6,
 			    treble_cutoff_text);
 
 static const DECLARE_TLV_DB_SCALE(digital_tlv, -12750, 50, 1);
-- 
2.43.0

