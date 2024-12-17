Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C416F858
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 07:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734419152; cv=none; b=BeRXCgv13BbJWNPcZcRiR3AWIsbPAp+FhUVhm7vyQBWOb9eGIsWZ2MTtkDQ9zYS/sGTWMcfLMDJl5cFDkO6Vzjf7HPkm1AZFKLBZ/rwEs5drZZiTqzMNSSzXRS5+Wk+zI5AEHT4cFjq4aVvBFq3BL2yEfkez1Mus78Jorj6Uvg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734419152; c=relaxed/simple;
	bh=zX2cFtcHCICYnLmShbz9S1nIR8E0jVMXhZVDQSSl+do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tgnjvOKjQVxP2GEhcVMp7fSNj+akew95w5WBDLIsN5cNoog57mp9aqKKSOwQQrd6iEwHDxLwJnIYQVwLicDwQylz+kn5Jfubl0cCX/5G8cnKLxbEt/H13rvZMtYT96d6pndSkixceCeiI/IRleJd6/h0c43ETxPb6W0bSgkEMZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PjJPyk4i; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PjJPyk4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=cv19Q1wJnDXa6l
	jWtXODVtaNwf0ZT2uRVQhVVv4kjrM=; b=PjJPyk4i9ytfFJBcSfUNF6Lvzf7ewX
	CuZoDS9t6xM/dPQmfDlDvhuTwvYsw7lL/Ynnt4HuroTfEVAAUZeNOHSkEDIX7Dyk
	DJ82/NtKDg0wT8PUSQqCfuYgn8NgjLMn58T+k1hA5X5HS9Mw4VyoOKh3U6YNYOkr
	HBCesVfAa6O9Ad5E0F3sheG0P3UCYNjKe8vB4dLdwkF/ptmiZRDG15sDOOAvPNBu
	PbU+Ex9EkUFqpTTDP3S7BDT+5tKR1Z5It0rk7jKUKKcKPoqh59yfCZtfhYO/pviS
	o4v17/0rVbXy0QXU+/2jUqQbmXD66Pe9ViGNoL+/TRpga3pBqXz1jgAQ==
Received: (qmail 3977869 invoked from network); 17 Dec 2024 08:05:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Dec 2024 08:05:46 +0100
X-UD-Smtp-Session: l3s3148p1@THof7XEp3oJehhtS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs42l43: don't include '<linux/find.h>' directly
Date: Tue, 17 Dec 2024 08:05:45 +0100
Message-ID: <20241217070545.2533-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header clearly states that it does not want to be included directly,
only via '<linux/bitmap.h>'. Replace the include accordingly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 4236f78beec0..bee032c3ebbe 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -12,7 +12,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/find.h>
+#include <linux/bitmap.h>
 #include <linux/gcd.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
-- 
2.45.2

