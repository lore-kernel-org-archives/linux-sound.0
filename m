Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A234A386D
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461906; cv=none; b=pRHlXkVYvTSJIlEG79bU/nRQpk0a79Jc5U0L+V2gBkcz71EocZHhiUosEsGi/EySdTzJ/HDTDJfr69CtHNM+mNyHF3T1oRLl7H7EVd5jiRDKZXmbgSoLs1Trarux9t9klGhfK3NVvoUsuutprAiYqRbGQr3COqxmp/THIKlPXHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461906; c=relaxed/simple;
	bh=pHulsae2A1FoJKTNELVUWZMuiXc5Ybs7Ufw1lrQ9joY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzWvpsn/K1iHmJPIEej/Z47VsnsgSLtEq/e41swYHjk8mhb7ZcoIMi5Mua6ynH2n5/PlqToMBna5kQuJWwNWTkrIf5ucVeUwkXoPpFiNLYynLkx9gGT0GaIo3M7rvhCh8JO3pxa+Mf7XIVrqyTyQ1+0EDLalnZlf95/T6rcwD0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IETcJdxu; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IETcJdxu"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f204f6so15039b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461904; x=1790066704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4z1tVkLKQ0TsrkmOyzBSx9X1Dw+Zr6ZbUQ5wODCWnk=;
        b=IETcJdxuK/N2DrZVAL7C3K4uQWja6YVVHht/k8UkABr+iS9N5dcvuhLLP/jYL1bEII
         G+qskPU8LtlRpJu9FXrQc81pwXipv8v+X9Zc9zBZZhGG5xu9iQP1Z7ICS/c7JQq1fyP7
         cebEJppNfue4P18h7gr9CmLfI97fWqEqPIjtxSyF/BaN4WI53jIki3a2bVrE/fWfFC0C
         WqOa6h1zoxI2WelY2K3g0faBO1tx12X1JopbQSJmGtxESpvtMI8r8agOvvVALjryOBDK
         UUdjLF5kCTRjC3eOQYQz7XbBcW3P9KZaCz9qPzJJpgI+cEb2oUQTtNQfJ3OEHoDgrbJ7
         dbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461904; x=1790066704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+4z1tVkLKQ0TsrkmOyzBSx9X1Dw+Zr6ZbUQ5wODCWnk=;
        b=HrNlODgr4i2NTxlKklEd+pCR23GQKQi2i92dJ+bCUSpiXY76ZS1NP8b77lw/A75TBe
         BPHdYSEHhck+t9FSc8oQZHCDq938+Osv5tTHpZ1rB/c4vauFdKZHGMnn1jAGUc8UM66R
         X5snjFicRh/ywImEM2f5s61dB1n3ofIncakchfMPdn1noENaem/L1xeZHLQ8oxV+dDIA
         3IVqdAydDBpWUoozfm0ZnfcABCMv4I4wak9uhRhmOXJz2RhY/2N41BSU54Jd2Smctg8Z
         gTyjDqtSQODjWo44FCaODlTT2zRv3vTXSHMxwjSAGb+vM3HmRBX6DtMvhRubpRv98BCm
         817w==
X-Gm-Message-State: AFuF++mLx7sGoFH5JL/Ko8Q4mlkxRLY9B6IY6t3pY1e91UUCkFY7GM6q
	ZYjbJid0Eb85hJW+MMIWV+bNszVZvUDk0W4ImlcVPLeG9rCdufIvkf0K
X-Gm-Gg: AYBFou3D3/km6z/+4q8mPY8OVwMkT4G2ooPn3Ao+wP2T5fgHqMbw/O1e+ANyz8KQFUA
	2owsU3l8R9nkno7Xls8Vv4z5bwCm0usz4AccoM4BQ1Ej66joDK38yelv40rumo/d6ods32oU5WT
	yPROSuljUAmV+3QaDDgWYVC/sKzAyT2RgnbntfYxXvrm0s47hjsVmc4e6PSd2NpjZ8p1GBeaLfE
	ZWKpfO62SI8H38m2ih5fYXHCpDZY9SzKOZhYkP6zwMG0gP1I98jKTTbMhqzRkMsh3/byTqJA8YL
	q9bPIVZDW1M6rjWx5YGtlXO7n2J7bmEitm7zrs5pQ33141PmELQOhSmywrWq6DgagSX2yU3B8Fg
	DHcmUabPuknCtHntw6mzNoEYFniP+ZxPE9AF0WoQsPeZKLigcpiJshmojtLgaesXuC/IWp1WOgT
	bJduPNRko2/KQawl8BYKeHve6X5b5d5DatGbsT6xxK7GuVS61+t5Fh809D40waxf4nupazeKtmk
	tzo4hYxcGxdaAG6PEHkQHu9TQ==
X-Received: by 2002:a05:6a20:a10a:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3dd5284c0c8mr454796637.16.1789461903331;
        Tue, 15 Sep 2026 01:45:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:02 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 12/23] ALSA: au88x0: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:13 +0530
Message-ID: <20260915084424.1007757-13-hemanth.selam@gmail.com>
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
 sound/pci/au88x0/au88x0.h        | 2 +-
 sound/pci/au88x0/au88x0_mpu401.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/au88x0/au88x0.h b/sound/pci/au88x0/au88x0.h
index 6cbb2bc4a048..f97a0303da3e 100644
--- a/sound/pci/au88x0/au88x0.h
+++ b/sound/pci/au88x0/au88x0.h
@@ -28,7 +28,7 @@
 
 /* Vortex MPU401 defines. */
 #define	MIDI_CLOCK_DIV		0x61
-/* Standart MPU401 defines. */
+/* Standard MPU401 defines. */
 #define	MPU401_RESET		0xff
 #define	MPU401_ENTER_UART	0x3f
 #define	MPU401_ACK		0xfe
diff --git a/sound/pci/au88x0/au88x0_mpu401.c b/sound/pci/au88x0/au88x0_mpu401.c
index 164f6b7039ab..dff4bf80ab96 100644
--- a/sound/pci/au88x0/au88x0_mpu401.c
+++ b/sound/pci/au88x0/au88x0_mpu401.c
@@ -22,7 +22,7 @@
 
 /* Vortex MPU401 defines. */
 #define MIDI_CLOCK_DIV      0x61
-/* Standart MPU401 defines. */
+/* Standard MPU401 defines. */
 #define MPU401_RESET		0xff
 #define MPU401_ENTER_UART	0x3f
 #define MPU401_ACK		    0xfe
-- 
2.48.1

