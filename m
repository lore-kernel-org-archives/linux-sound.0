Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E572744B;
	Sat, 28 Dec 2024 23:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735429167; cv=none; b=LY5jSvkswOWFttNE/w5TideaO+BWUelXtREVwt8ArbKn/tlKjJC5UHY6iS6EBrdiRcEVpkAzcp0JGo24vc10lUKAHtG9hwPsXqmdyqlRA9Wf624U2XLyhEOt84NqoVbGTdVq+TRxPK4UpmXAYAYoQg1miOe1W5viDECO9E1t2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735429167; c=relaxed/simple;
	bh=iPUU1OWkFLN+baW5CLTLT1hWusCk7f4syuW+9qtTVdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mF6eg0dj9sCPmKPdOO5O6id68Q2wDYBEbA/n5tCe6CgolAFoh5CV6+SrGipZcVO0ktl7oCfG3FU46so5+IkC4Li4kZHJnrdC3mefwHHEml/GZ+nPOGUc9NEbXZZ9FKi+DQoDpY322ftv62H2aLXJcBxfvdUzj6jN1iU/p0y7fTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=noDhfCxb; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="noDhfCxb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735429161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zDPYW5PhmR+Q6WuCPKiAnJhPiXrCgD+Sn7k8mzE1zHI=;
	b=noDhfCxbApf5AqUdP5XH8S4/LtNaEKcAn38RnQCkaWXNjCAFSAPPjbZ01eMRuPCyp5dvSd
	rp8L+6RhvKMcnlGyKXok63li/2OzxPOYq0qyWxhPA0ivX5AtfZus00o+H45iqGbfIUSp3O
	n+Ne0LnCoZK3Bsn91K6h0Bi+YZUzUO0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: AC97: Use str_on_off() helper in snd_ac97_proc_read_main()
Date: Sun, 29 Dec 2024 00:38:48 +0100
Message-ID: <20241228233849.686755-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/pci/ac97/ac97_proc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/ac97/ac97_proc.c b/sound/pci/ac97/ac97_proc.c
index 5426f7bc9884..518834964b7b 100644
--- a/sound/pci/ac97/ac97_proc.c
+++ b/sound/pci/ac97/ac97_proc.c
@@ -161,12 +161,12 @@ static void snd_ac97_proc_read_main(struct snd_ac97 *ac97, struct snd_info_buffe
 		    "Mic select       : %s\n"
 		    "ADC/DAC loopback : %s\n",
 		    val & 0x8000 ? "post" : "pre",
-		    val & 0x4000 ? "on" : "off",
-		    val & 0x2000 ? "on" : "off",
-		    val & 0x1000 ? "on" : "off",
+		    str_on_off(val & 0x4000),
+		    str_on_off(val & 0x2000),
+		    str_on_off(val & 0x1000),
 		    val & 0x0200 ? "Mic" : "MIX",
 		    val & 0x0100 ? "Mic2" : "Mic1",
-		    val & 0x0080 ? "on" : "off");
+		    str_on_off(val & 0x0080));
 	if (ac97->ext_id & AC97_EI_DRA)
 		snd_iprintf(buffer, "Double rate slots: %s\n",
 			    double_rate_slots[(val >> 10) & 3]);
-- 
2.47.1

