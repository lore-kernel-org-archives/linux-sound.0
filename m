Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065033;
	b=UECeM+85V1mA/n7XVwJexQroVWnRbwBN7HOx+yF9GsJX1WBLFeSarPEJXJFyvBE2z1NH
	 FIdvvoo2ZSFk3xwTbWvUMvgUL0cJtqwPJLzqiufWyVdrh1AhEuxnYmaGA+jQrudwVqKQR
	 tdAUdGXy21LEny0AH+hUCAAqDgFyo9kD5mDBuwSdQvybFmavrNTExG83kjMFG7kn6YwjD
	 v7vwf0Ms1d/Ey9ofgUnSAF6IXZz5hM816m/M2/HRxbyhQnVUIq3CQ1rsJjF22Z2ulLEg7
	 qVU2Xl788w6xMOVlHEu/2WyS6JGRsiZnFgwh2lSVV5sq1BJUHoNEQpPRlzZ8XZ0ieRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yuqPX9cgz/PfFshrpxeS4PIPejVFogW0dOjG9skcWak=;
	b=KZ+z5hCvrd/CkhJJwQ/OdOBMbG4+fT5dLm5zsDR+QjMVzTcJnDdtB0zdAWg7QNDaNSZ1
	 9TojTRy46fpxzEOmsJHEV2OOKjbVwEfxGRNZVUi6VrQKfhzUmlKNZ57lQmL2vaidITgXh
	 F6eBu410eSEIQi/Q+ZJXiEk3GicaXqQnFXLJPmwPFuPyKTjL0cPEXXwY1T0fk1pno7wcP
	 hwieqhyEzf1rEgyyzwVac5sK+8c79vxgkCxfetHqRwQNPx38PKU4E/5TAVch+HQoafluu
	 slPY+p+0YQMLzwviTixslSWv8WYBFjrHgIEBGpBFN8gWrYkQAaZUTVcio84DXaIP+DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RAiFLKnu;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE77606A9C5
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 15:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE77606A9C5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RAiFLKnu
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ace2e3a2acso12140381fa.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 07:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794065031; x=1794669831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yuqPX9cgz/PfFshrpxeS4PIPejVFogW0dOjG9skcWak=;
        b=RAiFLKnuPuOTGe1u56r9IzjIMT2IEqQUdwdsUla+D4Y/9XDsA9AfakGEAzZ8r8RkZY
         fZ47G0vtgINRh2yVIs882gHFQK0uvUdjSz7sU/LcCyGlt0Dmmd6MBoK/f4iDNdyW//pQ
         UpFjFHUb+paGIo5hZDjzcrhnKnlsqMpj46AgYLoUOi+7eIEFLUDvsAS57AK0Kgc3jXH9
         Il5Gb7FfkgK/R6lu+84vCyBUaQlvDCLRjRNfcVEOFkrB3Co2cZvni3MRU63tJiW9AxAE
         28spAjvjhdzqGSeIdNbnSYJTsAYgr2XBOUpjoHwJXiYCA6QOdhF7NantbMnAPjGWj83Y
         rIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065031; x=1794669831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuqPX9cgz/PfFshrpxeS4PIPejVFogW0dOjG9skcWak=;
        b=zn6+V/zChSKHRRB95DMEbbTxjPsoLJv4E4PwPRqO8a9xZdZ1LeRiqMG2r+IWsP5dXO
         DwxZCeVYKiecErl5kVg3Xcu9R+CXbbEG6n6E75PUvv0M9gTxnYKnTAGOeI3XN6W8qTbI
         wVAHWLFNGpGVbQMlJ3s+qcvJf8SVPebb0XMoe5oPWFe26V6GpU4SrvdAPS5QDxyBjO15
         ieq5bqujhkR484zLMLlnK5oeXIYyVQhOUCA77sLkUBDjFFo7gWTLMh9RN3mlQxAA7k9n
         9MtKHTBgSwWz34CBFlfhvwZXNotMojcaotAG3u+zXflmpMfcyj1Jtcm24SWKWDSlush9
         bM5A==
X-Forwarded-Encrypted: i=1; AL+hErEJuzXNpE7a8/Ne0LVEl36NDQYtPDLuoVeKR+3ACPvViPlLzHmTm/Tv/IZBPCvrvrSMGwD6O69fhTRhSQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9cCFAwAaYFqOX1CvrHJhLS8PH18LFE/vu8TPmpO4HZw64vA4qI
	v1qqj6glLAVwv4ISyv9004AhH5HqIVEurEtHK9PHauFRv3cADGoZ50Jn
X-Gm-Gg: AYBFou0zrEvotHPBa9KKr53DLDVwDTilz/6VJ5KuSSRy3iE7BrWkXO8Oh4f7rYA07Z5
	a6rUgm6i3DsFqNmKDabh42bJVdU1rnKhDEDW7J1Q2ewBegGfqCbuVfa44MC1/eT4HIim61/qvxL
	eCB1GipfNBLPF6ECkOVfp6dH66xB3uI7JnXAxzMa3J8Jyrh6ClHR3rw6xxoi6P2cqY1gJLc8ymV
	ew16BQtznpMw6MCL2urpvanNGXk7pi8lP8DXyNqJxonrjSVtM9ykAJ3JBxewYog7bMBLIBIOc0u
	tE6s14pXZE+NAelVwylRXUNasWYRaedI4LwukWYp5LuuL3C9nJDg+hiGv/wC88gJC/9NX5RdObP
	LuVtqYptT8PYOWDQDNwwbor12iH6O1zPsAHMlxCmjFl2JIL9rOCpPx1wuP5eHi3lgT8jFh07ePC
	GtCVEaQwjGBPWYfVFxOlmaDPpPqLjhOeK7A3kxbFJIlQrq296+hDjUu9uuySCZW/C1yQFzE74Ne
	Gs2vimoHa8MdpyVmSqhlVawUHvieFEPatOAE1MrtF/P/4+Eo8AH0FrUHpwPfHdtyzFTkTUl909I
	+w/wuFHsU6C0Zx7vfPxmrw==
X-Received: by 2002:a05:651c:a32e:b0:3a9:c840:10fb with SMTP id 38308e7fff4ca-3acf38960fdmr12270901fa.2.1794065031102;
        Sat, 07 Nov 2026 07:23:51 -0800 (PST)
Received: from thinkpad ([92.36.72.88])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acf5fcbea5sm7070411fa.33.2026.11.07.07.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 07:23:50 -0800 (PST)
From: Andrey Zakharov <dedemorow@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm_adsp_fw_find_test: Replace strlcat() with seq_buf
Date: Sat,  7 Nov 2026 18:23:38 +0300
Message-ID: <20261107152338.77837-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strlcat() is being removed from the kernel. It runs an unbounded
strlen() on the destination, and its size argument is not tied to
the real buffer, see the issue below.

The test builds the searched_fw_files string by appending to a fixed
size buffer in two places. Use seq_buf_init_append() and
seq_buf_puts() instead. seq_buf_init_append() keeps the NUL-terminated
content already in the buffer, and seq_buf_puts() copies as much as
fits and keeps the buffer NUL-terminated if it overflows.

Tested: built with gcc 16.2.1 and ran the wm-adsp-fw-find KUnit suite
under QEMU (x86_64, kunit.py, REGMAP_BUILD): 90 of 90 tests pass, the
same as without the patch. As a negative control, changing the
separator written by the firmware request stub makes the search order
cases fail. The directory listing in the pick_file test is only used
in failure messages and is not compared with anything.

Not tested: other architectures, the case where the 768 byte buffer
overflows, and any real hardware.

Link: https://github.com/KSPP/linux/issues/370
Signed-off-by: Andrey Zakharov <dedemorow@gmail.com>
---
 sound/soc/codecs/wm_adsp_fw_find_test.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp_fw_find_test.c b/sound/soc/codecs/wm_adsp_fw_find_test.c
index ae686dc4fa94..2a44b2670fa9 100644
--- a/sound/soc/codecs/wm_adsp_fw_find_test.c
+++ b/sound/soc/codecs/wm_adsp_fw_find_test.c
@@ -8,6 +8,7 @@
 #include <kunit/device.h>
 #include <kunit/static_stub.h>
 #include <kunit/test.h>
+#include <linux/seq_buf.h>
 #include <linux/slab.h>
 #include "wm_adsp.h"
 
@@ -104,14 +105,15 @@ static void wm_adsp_fw_find_test_pick_file(struct kunit *test)
 	struct wm_adsp_fw_find_test *priv = test->priv;
 	const struct wm_adsp_fw_find_test_params *params = test->param_value;
 	struct wm_adsp *dsp = &priv->dsp;
+	struct seq_buf sb;
 	int i, ret;
 
 	/* Concatenate string of dir content for error messages */
+	seq_buf_init_append(&sb, priv->searched_fw_files,
+			    sizeof(priv->searched_fw_files));
 	for (i = 0; params->dir_files[i]; i++) {
-		strlcat(priv->searched_fw_files, params->dir_files[i],
-			sizeof(priv->searched_fw_files));
-		strlcat(priv->searched_fw_files, ";",
-			sizeof(priv->searched_fw_files));
+		seq_buf_puts(&sb, params->dir_files[i]);
+		seq_buf_puts(&sb, ";");
 	}
 
 	dsp->cs_dsp.name = params->dsp_name;
@@ -160,6 +162,7 @@ static int wm_adsp_fw_find_test_firmware_request_stub(const struct firmware **fi
 	struct kunit *test = kunit_get_current_test();
 	const struct wm_adsp_fw_find_test_params *params = test->param_value;
 	struct wm_adsp_fw_find_test *priv = test->priv;
+	struct seq_buf sb;
 
 	/*
 	 * Searches are accumulated as a single string of space-separated names.
@@ -168,10 +171,12 @@ static int wm_adsp_fw_find_test_firmware_request_stub(const struct firmware **fi
 	 * a simple KUNIT_EXPECT_STREQ(), which avoids the risk of bugs in a
 	 * more complex custom comparison.
 	 */
+	seq_buf_init_append(&sb, priv->searched_fw_files,
+			    sizeof(priv->searched_fw_files));
 	if (priv->searched_fw_files[0] != '\0')
-		strlcat(priv->searched_fw_files, " ", sizeof(priv->searched_fw_files));
+		seq_buf_puts(&sb, " ");
 
-	strlcat(priv->searched_fw_files, filename, sizeof(priv->searched_fw_files));
+	seq_buf_puts(&sb, filename);
 
 	/* Non-parameterized test? */
 	if (!params)
-- 
2.56.0

