Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mFk8rvSt"
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 97E7544A0
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 06:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=IGtE5rwax0YMqdt4qD
	HD0apGK11EYOQ+7k2SFJLFuXM=; b=mFk8rvStX8PPZkpjqSzpvZdzZT+XX2wnTY
	Zkh/IlEreaxYi74ujpsXWDJJRANb8y0jxzcAUZwNHjR1NIzCjujxbSiHq4b7yO0o
	BcE6D01pVKw9lUR6kgc1l38oKBV9UT4XC4LzwZqKr0PZK5JLxCyvYYgwxZ6mcy4s
	QXvaJMpw4=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id _____wDXP_iupGRlxpK2Bg--.25290S2;
	Mon, 27 Nov 2023 22:16:16 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: s.nawrocki@samsung.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] sound: samsung: Add error handling to clk_set_rate in smdk_spdif
Date: Mon, 27 Nov 2023 06:16:09 -0800
Message-Id: <20231127141609.29008-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDXP_iupGRlxpK2Bg--.25290S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFW8WF1xKr15AF4ruFg_yoW8AF45pr
	yfu39YqFW5tw1Ivryav3WF9F98Jw4rAFW3tr43W34xCF15XFZ0g3yDKryqyF4avFyxWay5
	KrWUKFyUuF1vy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRrcT9UUUUU=
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/xtbBcgU1gletj1MvSQAAsA
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

This patch adds error handling for clk_set_rate calls in the
set_audio_clock_rate function of the smdk_spdif.c file. Previously,
the return value of clk_set_rate was not checked, which could potentially
lead to unhandled errors in setting the audio clock rate. This change
ensures that if clk_set_rate fails, the error is properly reported and
handled.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 sound/soc/samsung/smdk_spdif.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index 2474eb619882..c31b82b89148 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -75,6 +75,7 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 				unsigned long audio_rate)
 {
 	struct clk *fout_epll, *sclk_spdif;
+	int ret;
 
 	fout_epll = clk_get(NULL, "fout_epll");
 	if (IS_ERR(fout_epll)) {
@@ -82,7 +83,14 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 		return -ENOENT;
 	}
 
-	clk_set_rate(fout_epll, epll_rate);
+	ret = clk_set_rate(fout_epll, epll_rate);
+	if (ret) {
+		printk(KERN_ERR "%s: failed to set rate for fout_epll\n",
+				__func__);
+		clk_put(fout_epll);
+		return ret;
+	}
+
 	clk_put(fout_epll);
 
 	sclk_spdif = clk_get(NULL, "sclk_spdif");
@@ -91,7 +99,15 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 		return -ENOENT;
 	}
 
-	clk_set_rate(sclk_spdif, audio_rate);
+	ret = clk_set_rate(sclk_spdif, audio_rate);
+	if (ret) {
+		printk(KERN_ERR "%s: failed to set rate for sclk_spdif\n",
+				__func__);
+		clk_put(sclk_spdif);
+		clk_put(fout_epll);
+		return ret;
+	}
+
 	clk_put(sclk_spdif);
 
 	return 0;
-- 
2.17.1

