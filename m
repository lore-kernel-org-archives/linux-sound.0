Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5C239562
	for <linux-sound@vger.kernel.org>; Sun,  3 May 2026 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777803123; cv=none; b=nuSmZVxIqlJZOWhMZyfdtRX0ZgQYrOVQ9dPPWxowoZPDR8pKoSNuNiF7UUJaz03clljdPpIoc/qZIkXd62zsAPsT9l8s2J/va3xBelfUQXmu1BwIAES/PWbRAuwbFOpljoFCMlXjyKz6XsTmsyEa5+nry1QRYAGEmO5O2cAdxKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777803123; c=relaxed/simple;
	bh=UNv+GhBMdiYgsvcwghZf8bOiyXL2JoUDZ0XtVqjuvyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=egGChuLEWfmiVUjkODEZ+QSyF6VG/zY1eKQGVppPWdZa+OfMPlsm0LQ/dcFrg9gQ5wuTI10lodVLepnLrVFgUwCWSAKGvETSZ+JEfs3wK9nrXyXJIXYuVTb58hDRf6wWMkArdjVYcmeRspzf8PySr5xrv2eiGtHCeeOGWbu1HTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IiAhaCyd; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IiAhaCyd"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777803109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uzelRICgYkYVdCD63R812NV5/aeXBrdXUNN9wfdOSpc=;
	b=IiAhaCyd9hDpjMIg6PBSxfU88okIrA18IJPCmbr4XCpi4IO2kwyAVKg7NtUGUu5nUm9rZi
	wed5eflkGZcqfXX4r3RtLVSWmpIUIjXC4ANotWVSJJQYQOsxkkr3Guj0mPqLrIKGt+FxFE
	snACAQq4MJh9GjJL3UIbCGqInoJxQSM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: jack: use scnprintf to improve parse_mask_bits
Date: Sun,  3 May 2026 12:11:02 +0200
Message-ID: <20260503101102.298782-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296; i=thorsten.blum@linux.dev; h=from:subject; bh=UNv+GhBMdiYgsvcwghZf8bOiyXL2JoUDZ0XtVqjuvyA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnf5c31fgb17MxLmrlhYwm/wPnnG7RmcmesFHTrmLRqt ciK+xv5OkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAi5tcYGfZuZbFXeL1yT1r+ b9MjF5zf61Y7buVKCd0b1HrXNM3pIz8jw+Yfd34m7Z79S6Q0aukHvwmhzn1fBB4zeCs7zOe+36l dwQoA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use the return value of scnprintf() to keep track of the current string
length and also replace strlcat() with scnprintf(). Return the string
length directly instead of calling strlen(buf).

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/core/jack.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index 5e8a2f3f4196..96e0733ede77 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -250,18 +250,15 @@ static const char * const jack_events_name[] = {
 /* the recommended buffer size is 256 */
 static int parse_mask_bits(unsigned int mask_bits, char *buf, size_t buf_size)
 {
+	int len = scnprintf(buf, buf_size, "0x%04x", mask_bits);
 	int i;
 
-	scnprintf(buf, buf_size, "0x%04x", mask_bits);
-
 	for (i = 0; i < ARRAY_SIZE(jack_events_name); i++)
-		if (mask_bits & (1 << i)) {
-			strlcat(buf, " ", buf_size);
-			strlcat(buf, jack_events_name[i], buf_size);
-		}
-	strlcat(buf, "\n", buf_size);
+		if (mask_bits & (1 << i))
+			len += scnprintf(buf + len, buf_size - len, " %s", jack_events_name[i]);
+	len += scnprintf(buf + len, buf_size - len, "\n");
 
-	return strlen(buf);
+	return len;
 }
 
 static ssize_t jack_kctl_mask_bits_read(struct file *file,
