Received: from mail-pz2-f16.google.com (mail-pz2-f16.google.com [74.125.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C774A4F00
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461924; cv=none; b=BGxlz4tM5xV5lUvzbjO82ZjiB4Ucc3tQJKGD1RIVNJWrlJa9U6kPYaHZcvDc4ug/fQC+Gz9LegKNXOJxhHqNOISngHKEe5LvMPKqRFvmtlqCtCjWfTbPZ5ZOfpMhr7NFNCBc+V8gmMTO6XAjaFNwvEkH9+zO6JX+o1GUiaXJIhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461924; c=relaxed/simple;
	bh=5jR6uLg5qSyjz7iwOFenidaDwI5Joosb9JoiDSQKByM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzu9WzJsVP0o198bJuKu58lJo0LjzpVrzR97R88sAVVJK5fuv1iYS0Rx22Fo2H1k4FbjTrMr9qwJDXWZeMgOFK8vCHYlmhkh/irOxxFdgCP/DAq7G8MyqAi3iRNdd6lTn9Nn6Ag1fIGMAmbt1nfC15Xee10v81tYgNYvOUF5pKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2JQstBE; arc=none smtp.client-ip=74.125.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2JQstBE"
Received: by mail-pz2-f16.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so13642a12.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461923; x=1790066723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQVlFvmZNrWyCQ+kgiBgD6UinTWUtjS83tIH+0aoFT0=;
        b=K2JQstBEBvLbiyDdetTo0gpCgE+4J14SWRf/6mgYrYuJLbLhuGlLK0Jx32Ef4BBF4u
         PaccZexu7qG4RugE7cafoocOtuH77Lb6VRjS2cqRG+YPlYnXi71qXulWCy90vfHlVVmC
         tYIL0rC1rH4z9btZeEda9ksEmkKKlCWG56iuTxr7reBpvoCOK1tiyMuZGraU0DDmKFan
         H0a6BMHKO/CviiZFZvp5izdwQQRnsC6fkXl55ON75gx67Ck06bbzAWTHyzW6te1KY1CV
         ZOvZFwlpOGedJdIQnkKLPQkO6J7e+2vAw8SVnZ4soBNo39nWelWiB6gfkgaTvBcqHF6v
         XPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461923; x=1790066723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dQVlFvmZNrWyCQ+kgiBgD6UinTWUtjS83tIH+0aoFT0=;
        b=PfvngDpinaTKp03IkdcwE8G7c5/KHtzYJYmnhmz/M/CUv7H6gK36obdkKJyCHERrB+
         za2DbmxN8PAxSuVneBaUGPYFRjXAxKMSAWbLarqj4n8jPSxgh8+EKAsf5ahdyRZlljjM
         qxP8QnkqaFfSFcv9qeqVeMEdkMgL1Uctza4T5WLT+LrUJqMhylVGPAFGxUg8/HkoqZSs
         WqH0kRc8V55P/vDrHN5tJjaFL9AowyeeAM32rT6OqzXMsDluFwiUdsiB9QeQgPRd8tfS
         nXWJflEzPTvfK39G2Oiciemti6GL6Silb169Wawh+gxjO7c7jlRaNuH9S+CmGlWP5h57
         X94g==
X-Gm-Message-State: AFuF++kFF6jp22pI/Jw5IoXdAAO1kyVEr085n7AfHFowTsOrY5KWNGlK
	ngEUP1GNvWChvxwLY4yxaxgJdVfl4ijXUq0cxC6HuKSEiXZaf/gS49WH
X-Gm-Gg: AYBFou3fCm5M27nGV1ldz6X5HrsnA9xqjjZOlFUCcbcsS9n8UlJPj9haG0QsofIke0i
	eEzAdGz4UKLygHnplNvrmXlcyAUeO5tVG6W+//SSJTUGbFGTDDaloamw33DZqlxE3jDNfCmgkwH
	g7uJwdlfTKa6JML2y1K08YWnmr28Ol4O/Jq2ZRV5Mqp1KOjxOGqlJIxRyGhRuVuhbylseoRXoQL
	ejjZnKJJMSWoeUg0yLsJBaiqsFMwag5Ib/FHb8XbY1skfB5XN1Zeb7ji5Ev2uaKwsnGmxb12gmy
	x6OD8RXZ+IAtWeoDUGoiAH8vPXs5GQAAKlhi/N35Uot3E2Vh8lLEWaxERKMa4OXwnRiknlK0P8l
	5HUAfOOm4gvEBTWUeMekJzJbjO5Rkw0cQ6p1YaKG6t1i7CgQp/3azUvyLRIw6TCOFAsQYFJuuI5
	8g0SS4eoshMIz0LklrnO9hHqm+3pHHIBt5pcALSYD5sO3uCZxPQyfO/fu2qlGxdrFbQzT7S4CLy
	BNWHdEMUfkNwdm0VXGC0Y/o/Q==
X-Received: by 2002:a05:6a21:7007:b0:3d3:af85:eb99 with SMTP id adf61e73a8af0-3dd52933947mr467810637.27.1789461922896;
        Tue, 15 Sep 2026 01:45:22 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 19/23] ALSA: riptide: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:20 +0530
Message-ID: <20260915084424.1007757-20-hemanth.selam@gmail.com>
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
 sound/pci/riptide/riptide.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 99c00e46ce23..697fece744e7 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -264,7 +264,7 @@ MODULE_PARM_DESC(opl3_port, "OPL3 port # for Riptide driver.");
 #define SEND_SI2S(p,b)             sendcmd(p,PARM,SI2S,WORD2(b),RET(0))
 
 #define EOB_STATUS         0x80000000	/* status flags : block boundary */
-#define EOS_STATUS         0x40000000	/*              : stoppped */
+#define EOS_STATUS         0x40000000	/*              : stopped */
 #define EOC_STATUS         0x20000000	/*              : stream end */
 #define ERR_STATUS         0x10000000
 #define EMPTY_STATUS       0x08000000
@@ -453,7 +453,7 @@ struct snd_riptide {
 	int in_suspend;
 };
 
-struct sgd {			/* scatter gather desriptor */
+struct sgd {			/* scatter gather descriptor */
 	__le32 dwNextLink;
 	__le32 dwSegPtrPhys;
 	__le32 dwSegLen;
-- 
2.48.1

