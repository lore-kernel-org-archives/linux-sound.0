Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896302236F0
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293561; cv=none; b=Q8sFQi7abGiHVD0NpsJgWAUQq2Xw25xDtNOXfkBLOCaFcXBuaHc9SQi/5/XXHgzMdKcDimwsIJSeCOZBN3PmigjHAO9ViE+uSzltZNypW5R8JOy9W9+SFp8jyXRRz+Z8Q2ki3eLDEG1y514T2YogkArHkrwGqU/jwmrmASQ2acM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293561; c=relaxed/simple;
	bh=C99RJAfBRGvhIreO2woMj+OqFJjfnxUIIPSbSJ0Jq2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2krMau5qf542XsMoG4vNKzZ26hWg/uj/R1B81NfhU/TCNoNQkuexZ2fiJGrUALoNUpcgo9s16GgtC+I6P/iZbjIogslDnCIbSTx2D9TktUlHEYUbJZFE4M5ZnJzOqB9txmZwhAJBoeE5W+nIORnY+06SfcT+De3moDdCeKvZIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MPDNBdVg; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MPDNBdVg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765293547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VGue8Ri4teGHEyVpQyRAb3GsyN0G8Qn7brGY0hdXccA=;
	b=MPDNBdVgO9bINl7Txu64UfZh4Ms6cmZHplTpU0lL23VVrlGBD41rZ7HtsuNrS6e+V6WAdE
	PieYaa4gSOGBg0vVAsceazWDK9etDOLhwbtutrs5POlwxvzv9ovmVE/3UfPKy7qJ8H9gJG
	ZUSFZ5vRZ24FF28fN2UtQbf+EpVm2q4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wm0010: Replace cpu_to_be64 + le64_to_cpu with swab64
Date: Tue,  9 Dec 2025 16:18:50 +0100
Message-ID: <20251209151853.432518-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace cpu_to_be64(le64_to_cpu()) with swab64() to simplify
byte_swap_64().  No functional changes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/codecs/wm0010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 7511c71695c6..6e097d8ed288 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -326,7 +326,7 @@ static void byte_swap_64(u64 *data_in, u64 *data_out, u32 len)
 	int i;
 
 	for (i = 0; i < len / 8; i++)
-		data_out[i] = cpu_to_be64(le64_to_cpu(data_in[i]));
+		data_out[i] = swab64(data_in[i]);
 }
 
 static int wm0010_firmware_load(const char *name, struct snd_soc_component *component)
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

