Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655926A0A7
	for <linux-sound@vger.kernel.org>; Sun, 25 Jan 2026 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769356372; cv=none; b=gWHwTh2tJ1pnK8kv10SE1ICYp38Ffw+M0aj7VzPzmHemzPSEvWB4I5chJk8c5pWX/JHmcI9qQRbCNl4cuxrofdlGx+4BEbGr1/OvdPwVm/7bHO7/cITb6ykh0OrYi0DrvH7m6zWr/fR8cLTD/JkfB+NgKzEPtWJwmDF/I1BB3kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769356372; c=relaxed/simple;
	bh=V7I9QRlDmVBEpyH/WNYBpQItc3kvSYZZP1noNYGLQmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nuskca2P6RFEgtflSyYFVmMBmgGztXO3swyYrMc4jjKlmKOBaYuCvLWEEhbL4i1YT0bCmuv3798KkfxZ8g1QPm9MywuFxwwXNtvuGpfqokxPPur4w+WYWBudS/wqcta3qc59R5ZhsDbeskRG12BxKMEXfND6kBON7y5QUQfnjog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eHNmAljn; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eHNmAljn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769356367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m/04t4CEaTXRmV+ptaPjHhxVSkeeVVYO31WCB5WIogQ=;
	b=eHNmAljn1OvBVuItJvujJlX3Rb7GYeGOyQhLltuH42h19kTFxISLdbS6QUSk+7gekB4S+i
	BLVSKCq/3lj57NP5eo4ce0/zN/2AbcwgmB/yDYov0+8EdGWsI/oD4HQCCGdtvcEX2V1zo1
	fknwxsO+9a/ZNzI+yFDwqkM/DzW8YHQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: jack: Improve string handling in jack_kctl_name_gen
Date: Sun, 25 Jan 2026 16:51:56 +0100
Message-ID: <20260125155159.98720-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

If appending " Jack" is not necessary, replace snprintf("%s", ...) with
the faster strscpy().

Additionally, rename 'need_cat' to the clearer 'append_suf', use local
variables for the suffix and its length, remove the confusing comment,
compare strncmp() to 0, and use 'size_t' for the 'size' function
parameter.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/core/ctljack.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/core/ctljack.c b/sound/core/ctljack.c
index 709b1a9c2caa..6b6ab34fbde8 100644
--- a/sound/core/ctljack.c
+++ b/sound/core/ctljack.c
@@ -7,6 +7,7 @@
 
 #include <linux/kernel.h>
 #include <linux/export.h>
+#include <linux/string.h>
 #include <sound/core.h>
 #include <sound/control.h>
 
@@ -46,17 +47,20 @@ static int get_available_index(struct snd_card *card, const char *name)
 	return sid.index;
 }
 
-static void jack_kctl_name_gen(char *name, const char *src_name, int size)
+static void jack_kctl_name_gen(char *name, const char *src_name, size_t size)
 {
 	size_t count = strlen(src_name);
-	bool need_cat = true;
+	const char *suf = " Jack";
+	size_t suf_len = strlen(suf);
+	bool append_suf = true;
 
-	/* remove redundant " Jack" from src_name */
-	if (count >= 5)
-		need_cat = strncmp(&src_name[count - 5], " Jack", 5) ? true : false;
-
-	snprintf(name, size, need_cat ? "%s Jack" : "%s", src_name);
+	if (count >= suf_len)
+		append_suf = strncmp(&src_name[count - suf_len], suf, suf_len) != 0;
 
+	if (append_suf)
+		snprintf(name, size, "%s%s", src_name, suf);
+	else
+		strscpy(name, src_name, size);
 }
 
 struct snd_kcontrol *
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

