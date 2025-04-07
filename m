Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4222A4DA
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018094; cv=none; b=M2/Db/PhDBMdq0tQBbdt62FxNU+AsPyXRycjcB3f1bDGR+nem5l/r58El5+v1fmSh//p4Rf7jOrk6UVat3N9EtNwQvFhFzcaOW4EjdrTT2RWTV9QQN1vwhcbWTGyU5LOGxN9Oqd9vfjSbfHq8ShozTmvizhBM1LShfYs+irR4lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018094; c=relaxed/simple;
	bh=kaEK2PfkJbH0B+KZCkqdDSumCBqbOs/IteqoNys7ZM0=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=bzOCg8LQSABkXGae9sMAAHYa5D7a9rX3fm8zCfmvTZ+CwIhPZR9ONIcsgqf4fYe7vHn6629X6RWSjO8hM3LQ0aD9/qJSxh8hN+ad5phcB61YDFKjwqUsTpLFOMRDIPgTSGrGXLz+wmxmelVn9r5UpeeLytJZmBlsKUxTYEFkEec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=dw+OU3GF; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="dw+OU3GF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1744018080;
	bh=Uj/VO4Z99wN3rNm1Zwgl1xJ9VHwahCSp8Jm5LB0fOSI=;
	h=From:To:Cc:Subject:Date;
	b=dw+OU3GFOEQ6u2za92/0q6IyX017B7Km+Po9VOMff5BHKynsvRfwB4+NZeoOE5eii
	 UbjPL3wQdeJec0T/e7rF/HvU4lq7pnHtH9RJLK/QvGt+0mINIcI7a8PzpcjDEmJbsL
	 Lba/Xj0jT6bBwpIM6FgfC3/Rk3AvibPIkrwUS4wY=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 5651BE10; Mon, 07 Apr 2025 17:21:37 +0800
X-QQ-mid: xmsmtpt1744017697t67422pqj
Message-ID: <tencent_7F01F2D14BF724692ECBF5346283DB9BCA05@qq.com>
X-QQ-XMAILINFO: M8Cd2byC8kc4n0ruyA3LUxB+lHndpIPpI4HAoANfqGt9VWy5eIxl0oao61ZY4Z
	 GuNkAbi82S5AMMXQH8fWGJanw0UCjx4tiGGa8r0Q3/YoJ70j6RVgkXcKWqojWPLnCtrbS7ddw4hu
	 O5nxUMtYGOno8YJSjK58Tzsldbs3weKjfZTyYiUwVYEH1nWh0pUtWg4Xkv/Qmv9HnZHewjmBvwn2
	 OKTsojn5z99vYges6cN6pLEByI8DD0mIdczCV77DbYLsQtS1f+aYKu+3+hSxqYf34IPvq5avhRoN
	 vI6arGf0lQf2J7A1HnX6BHVqBgbekNcvJela2+oTpJzTELoZQzC2yPRMLgG9/JmA5p32w+psebkY
	 h2oAOJ0pGMdZUYn4c3y1p57CHkBzUtnEE+8hCZ/xcTb0wWsWXEjHm8YBNgqQgzTED8Huv32tJ9N8
	 WJQNCPadU7E0F1/v/AsxJaI3/NGDEVug34hMuhFBfXv5sJ/pCR0eIdAD2wU4YNu5KP98SVHwjjFU
	 y8N2CWb+ooUmLXPVyKlAdQtJI8JsQgFkwf7SdZcmxVQ8yOEB96Hh1WxC5BeZIQMPGn6DL33nrGdq
	 uqJVdy/QLcm8aYA3RLzmaZywrCTWw51y33i2A78u1JFDwqs8At9mnjQYUERy+73hjkTod9nzqk3s
	 W5JtEznoSVE7I8OuBepnUTpze6B52Aytyk6xW3sdfBrmgPhBBaoeEHCma9h83Xl2PUupT8gdnYov
	 iEB/3cf3TfEegIZ09EpGLOIJd0+4tRD9vo1MNd2STwmIaOvbYEiTi5G4nHFM/Xq8mkVERu7t8Osm
	 ILP/AsSGk47oOfHBA3Pm2qgtP0CaFtpUpRxu7zSuevkWodx6rKHuyxBZUGeqYrr74W/a9Cg/m4w0
	 P+I01qrWfBUizg6ucuSZnHWQr93rYHybHZ3s0YhiWyYQKn0rQqHj7cz3a79ZOUJBq5QdzfgydhZ5
	 93h0vTytS/E90Ldlmy7tqpp8NakuScnY2OCbMAJTI5oEziSlpCgU+9PZxmiCK8
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: xiaopeitux@foxmail.com
To: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ALSA: kunit: fix build warning in test_card_set_id
Date: Mon,  7 Apr 2025 17:21:36 +0800
X-OQ-MSGID: <d7f5438affb54e295cf7ee13cb69235a29cc6a6b.1744017611.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

build W=1 warning:
sound/core/sound_kunit.c: In function 'test_card_set_id':
   include/linux/printk.h:455:44: warning: '%s' directive argument is null [-Wformat-overflow=]

Fix -Wformat-overflow warning when card->id could be NULL.
The kunit_info() call with "%s" format specifier may receive a NULL
pointer from card->id. Add a ternary conditional to safely handle
potential NULL values by substituting "(null)" when card->id is NULL.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504050922.ZzbkiojG-lkp@intel.com/
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 sound/core/sound_kunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
index 84e337ecbddd..56c463f43592 100644
--- a/sound/core/sound_kunit.c
+++ b/sound/core/sound_kunit.c
@@ -268,7 +268,7 @@ static void test_card_set_id(struct kunit *test)
 
 	card->id[0] = '\0';
 	snd_card_set_id(card, NAME_W_SPACE);
-	kunit_info(test, "%s", card->id);
+	kunit_info(test, "%s", card->id ? card->id : "(null)");
 	KUNIT_EXPECT_STREQ(test, card->id, NAME_W_SPACE_REMOVED);
 }
 
-- 
2.25.1

