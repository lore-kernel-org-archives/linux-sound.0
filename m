Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48143B27F3;
	Mon,  6 Jul 2026 05:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317117; cv=none; b=MJe25v02m/4k3IxwrxWJRhpe4rZ9UwlHIX58uY7d/igIH+jia5k1lhQxVGzRCtYg6mi9Sb9mXkyWEkKsf0is1KoygMDdNa+Emksn2eiKc38eiaKdHoO32Vx/SGuN2czICF9rLGJRwaq0rZYznOfrMH9CG7v+QUOyOo2PE6pr1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317117; c=relaxed/simple;
	bh=JmLhQxvQzcl2xGCtfQ+Ug8YP3dx6xqsDNdSnkapFis4=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=QlCxNcXczMdmrQipFlnq0NUXyAdvnN7AiSNtivUrJzeurNX9CpCQqOSGVsrXNRMlMiPcXntMr+xpjE/1egJ9FxpOCTzOoee2lWgfLnpALbH7gnTvwHimhF3VZ+ZB43RLTs8i3mcNIZoR3DjOlqwxvVDVU93pTG7K09f674pXQYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=ZLKLVNOA; arc=none smtp.client-ip=203.205.221.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="ZLKLVNOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1783317110;
	bh=XD4w242KhMmWwaLTNO4LPKfH3cAdkqR39phhyFhQreo=;
	h=From:To:Cc:Subject:Date;
	b=ZLKLVNOAlYxDoYTchSofNU3t7lwR9ivhtTirU1C41T1Gr4XFLS0KcMFa6FOhjGJc7
	 clxatfxsNltMooQ1Irl64jeMuvMczh0k2U0+Yj6GX5T84XHX0/XStrU6tMo8O4X1Go
	 +42IAsScXABAY0oz9debXyVa8p8q8oJwgw/XQv2k=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id CF03C62D; Mon, 06 Jul 2026 13:51:48 +0800
X-QQ-mid: xmsmtpt1783317108t81eoqwz8
Message-ID: <tencent_01DDC11413DFF88ADAB8476570B894B50F0A@qq.com>
X-QQ-XMAILINFO: OV65e10zTgieaxtgJXLiO32uwZbucX/SPB4FZ/3ywOr6b3sx7mn1K0XV7iqDG/
	 aq6qvTIPYfS+jCfNFlBV7Qrhyjb3/xnZLKdcPRwgmlhSxl+k5AZEgaqi934wR5Urkh1sht6v3muF
	 yEOcw7PfC2hm/898/b9WNJ0n/WI3nR9yHyevl06b4fpWwvBNpbgjqOgveNf10SaGkaumU4o/hfZn
	 AUmAWNBG7zSYl2E3jrjdNAdKwbhAiU9a2Yetdd7irrKClyqiLdsjJE42H983m32hyrX0iBkpozKk
	 m3V4wB3q8ra78ItC3rHqvF6RBH8XVSD4pHh2JELKzJrbnkEllHPMs55unSKoSCp26a1vTXZOXqDu
	 7RbYsDpSOUDh4fOCEK2tHc3XORC8AboGDhILMaYtQ2YKtZZwiPALRkEg53NhmB4FSwDV2cBtNjVS
	 xejtnuG4ZuKQ9hBcBSx8sgvB23jGpelU9fFLrcTeGYQRlGcRp6Hn9I+6tc3braWrZAH9kYFp+bmW
	 dTWEA0Szx9+nn+WpkP8AplKel5CPkPrjZpeWzuBZCA7W36f06j42M+E90nKkrCryKr4O65vDukrc
	 gKLFgJcVNLAgB5b5TzwYvFbDuwPaaEZ6DiLkWT3Ha8NyRsvtac+54DJzPQLuZqUbugs1zu0WK4NK
	 OCWhRfB2hMDvwNnmvdvM6uN9YvgE/fc4ySNJE3VwZmahiQsThqWhp74TQPyTN7WVdNpl4OWJKmlG
	 NCtjLw9ILVGX0MioVuTkUUm1EZryMgyrPvXcMW/PncMpulzLyWtqKbo1sn1laSsf/urH+bxa91Oq
	 7fN5Aq8rf+93tfvqM2gh+U8JLlCxTJOFnxVEOESWlcsuRDPYIliuDsEJWWJiVO7LxcX57562puAy
	 fevQv+BBEnR6OtLX3XnSgAMed4fdMOX4AZHlY8fUxItCcWWk1wdAat1DByKRli9P3z0TUhe7/Y7p
	 RRbvtCg4zn1mfRZQlxzUa0TyueR2+uD7ehKJF8fwLH46pdvOYtmqeHTFa9t5pPc2Xzo/IMLWLjzd
	 h2QyewWSYLTkvDvyx92SDUHPvrass=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Zhao Dongdong <winter91@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	peter.ujfalusi@linux.intel.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: [PATCH] ALSA: hda/intel: fix memory leak in hda_init_streams()
Date: Mon,  6 Jul 2026 13:51:31 +0800
X-OQ-MSGID: <20260706055131.289810-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Dongdong <zhaodongdong@kylinos.cn>

In hda_init_streams(), if kzalloc_obj() fails at iteration i, the
previously allocated struct hda_intel_stream objects (0..i-1) are
not freed because they were already added to the bus stream_list
via azx_add_stream(). Returning -ENOMEM directly leaks them.

Call azx_free_streams() directly on allocation failure to release
all already-linked streams from the bus stream_list.

Fixes: e36a88b33cbe ("ALSA: hda: Move irq pending work into hda-intel stream")
Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
---
 sound/hda/controllers/intel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 4b03c64e72ab..cf5783acf440 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1866,8 +1866,10 @@ static int hda_init_streams(struct azx *chip)
 		struct hda_intel_stream *s = kzalloc_obj(*s);
 		int tag, dir;
 
-		if (!s)
+		if (!s) {
+			azx_free_streams(chip);
 			return -ENOMEM;
+		}
 
 		s->hda = container_of(chip, struct hda_intel, chip);
 		INIT_WORK(&s->irq_pending_work, azx_irq_pending_work);
-- 
2.25.1

