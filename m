Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC6629
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 00:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736727218; cv=none; b=eQfw8wGueXMbcxFBi3cVNM7lpQOHF7pVXDigUsqaKJrDl4i71PwMExrE+R46He1V0E1D16qKlc78pcFx2yxfHeWzAgzTPJIOdMS1irgQfmJMxLnGOTiEjE6jg+xLsnGtBfTN9dofpcrYoiFzofG4MZsS0w+pWi4Q0E6cMgbQ1ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736727218; c=relaxed/simple;
	bh=ZlFBYo5h7LGJ1/l/QHz7H3DE/AcrJCuOo/lpN9ULRkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O/ehTWls2T00AWGVXQMrwyzELr7pub6CkV05T+M76lfQSERbRawZiadqw/8PzPb+noKHoZzOP9xU53lFViNIVSSIAm9N/a669uib0Jw55Aiuwvn3J0I1O4s5j1DIpPWfQwPsQKdMTj8lNGz9HRZGDjtxYyJD8P8GF+SryaqaNVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VOPv9KKZ; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VOPv9KKZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736727213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dO2Yboz2F3pGEQEYNYbFyosxQ8UlBjN9Z7A4NSykAgU=;
	b=VOPv9KKZ6cM1Z9qOR2ARV2EPzX7KTc9FGCTBJ+aXjk6BoUprF6pERE/qfbGZGKtBP80Dr3
	6gMRAKaMVGMyT7NP8i2/dk8OAN7kR3A/0pPIjoMpxmzCvwlYGnYCVExncePKJ4jVaIQErz
	FsutSBcB/jHRgLp785kBZVsDqJDceUc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: Use ARRAY_SIZE() to calculate PEB2466_TLV_SIZE
Date: Mon, 13 Jan 2025 01:10:01 +0100
Message-ID: <20250113001001.400669-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use the ARRAY_SIZE() macro to calculate PEB2466_TLV_SIZE and improve the
code's readability.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/codecs/peb2466.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index bb9ca6354ae1..a989cfe058f0 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -26,8 +26,7 @@ struct peb2466_lookup {
 	unsigned int count;
 };
 
-#define PEB2466_TLV_SIZE  (sizeof((unsigned int []){TLV_DB_SCALE_ITEM(0, 0, 0)}) / \
-			   sizeof(unsigned int))
+#define PEB2466_TLV_SIZE ARRAY_SIZE(((unsigned int[]){TLV_DB_SCALE_ITEM(0, 0, 0)}))
 
 struct peb2466_lkup_ctrl {
 	int reg;
-- 
2.47.1

