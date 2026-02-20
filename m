Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265302701C4;
	Fri, 20 Feb 2026 02:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771556293; cv=none; b=tFoGUl2fNd9rTNp1bvyfN8MUnyf0x+3bCAArYumrmvbwtK1iZ1mw4GlQXtn81RiziRzPjFWhGvv9YsW8J70mu2ntHsXICOXJDwgqGxlVcB69o39kgPgeRAH2NoPcvvHyAHqByw0/qTXhYR4XklHerP0gqyxMUMdN7mefSnyBI6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771556293; c=relaxed/simple;
	bh=k2AQDipbdmTFVg0LmLZEWX5a9eSCPpDKq8abeYwbmbI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Ht1BONLzpL/qUzHpH/KDgAPt6FKbegWUGmT9bjiSbkv8+RHzR4FlHTFFbHhAy5uCZ0qgAugsS1nMho/6Zg4B29IF/t6jcRsy0NpTeDw5vVg2kPCFMYnpPwc0F6Bl7JSJAMRwblQwQV30gR+h4wpbdmwhvwTUBRynuQO6PPTakRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=lYtIE1pf; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="lYtIE1pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1771556280;
	bh=DNib2xu6KtM5CtLa4snnoxeouEraHAn5AlAQVSpyxXI=;
	h=From:To:Cc:Subject:Date;
	b=lYtIE1pfWqKf90OrtC/fzGEVKI1/FZR3XeDOYiclyBMEFO0v+LWexKOc6e2lZ70wZ
	 T6Ffa+P4A1CpuFV8e/OZkaZY7hEvZGb68uyKmWW+rZnsXSPhn+XmlNAEM58N5C7boO
	 imKlaluHoyTlyogaORxy1sQyDqOXAW8oWztDdF+s=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id E2A1048C; Fri, 20 Feb 2026 10:56:42 +0800
X-QQ-mid: xmsmtpt1771556202tgmsnwsd5
Message-ID: <tencent_D7DDB8B646B471AF50B541DA7AC99FBCCD0A@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeg9vFjGTSg4k3Zn30WaGnVPXkiDlPZbf5SEIG/uBYsfTrJofwHl
	 4tEOq8BKn2sGmeqyWTrVaUnxm20WasBt9Nt7d9vUy9FoDE1qqrkcR5ekksRHNtP+Mb08GFhFoatj
	 KxTbaXEuYAau5AuYQT295S8P/gR4Jv0GGU2LhvLvFlPMt7rvPlAIa1xsr2/j5N5tl7X5CWLxqPLY
	 uT6iwN4cVvTJi/KfOjo96zaoKGSRy1LLwUOUYQjy8BzXsNgNfdwIcg0sdjxSsrpeot2+b/hxOjwM
	 DcVZDL1goaGQfZVTX6jhkeJwC1+wRH5fcv2lNF64b8pGTuu3QhH3Et2xWzQNf9jPevLOg1/blLPx
	 tY7HdVG2yGugqaXKjmz80n/IDtJo+qUqs3tYFqCEZFgrhbq1mapP54z0FrHhCp/FDXhuHgFG6C+U
	 jqmmih+Bw+Y2A9NkZnRyLySJsydiMpDfwVX1hKghQYGsB2AjwVR43sxbR2KrQf5hbjIHEOT5Fspo
	 Z3Ii0wCtZiIouP17MoCvDsrSGGCbmbDyyYMe74u2GizOk0T6NqHgXmD1u1ctUAJ1GIRdoiNkD2fK
	 wvOR8mLGPolh9HNXzcUoqIs++mAGqQrIC4tYYat2Fs8CimP0GZ41W+qBi7B2AEWHu2fvUaGoE+us
	 tF5cXqNuOuwZGT7U8tKGzG3u52/Vjqxj07plKw0nVFfmFfyjqnO1vflOklmy3MtuJlLZrga8caj/
	 E7CLlL4caTySx6g9wohtT7BuvepinVTeMmiXhlgB1I+CRvMMDxqSCLXi+m5HK/T9EcdUx9Vmh/5a
	 /mPCwkYpJEOsQQo0jVV7oX40PTGRAntTynLqeyRts7ihRwFZCQpuzRF963xnbD7w6W0wrOHwbb2I
	 ilS+X6bgOjn2gUrX6KBExtt912sHm3jfp8CPvRXIiOTz9scGg5WLtUu3/5gxle2cc47WT9EiW/Yt
	 Hbmiwd3fqgXFWUsZtJK4Etr3x1hFYpVAK8B/zoHIa4Ul3goVtEF1rZ/ro3rpJzXhxOGHW5f6hP1/
	 3W9WlqQLn/tj3wg6Cvcz2BdsOHX7uGgPmD4Av04w==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: xiaopeitux@foxmail.com
To: oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] ASoC: rt5575: Remove redundant assignment to .owner
Date: Fri, 20 Feb 2026 10:56:40 +0800
X-OQ-MSGID: <fe45f6628dd92d81f673d8ac56db201c9e53aed8.1771556101.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

The coccicheck tool reports the following warning for this driver:
./rt5575.c:342:3-8: No need to set .owner here. The core will do it.

The manual assignment of .owner = THIS_MODULE; in the rt5575_i2c_driver
struct is redundant. The i2c_add_driver() function, which is called to
register the driver, automatically sets the driver's owner to THIS_MODULE.

The driver core handles this assignment internally, making the explicit
initialization in the struct definition unnecessary. Remove the
unnecessary line.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 sound/soc/codecs/rt5575.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt5575.c b/sound/soc/codecs/rt5575.c
index c5525ad195ee..24e41af29689 100644
--- a/sound/soc/codecs/rt5575.c
+++ b/sound/soc/codecs/rt5575.c
@@ -339,7 +339,6 @@ MODULE_DEVICE_TABLE(of, rt5575_of_match);
 static struct i2c_driver rt5575_i2c_driver = {
 	.driver = {
 		.name = "rt5575",
-		.owner = THIS_MODULE,
 		.of_match_table = rt5575_of_match,
 	},
 	.probe = rt5575_i2c_probe,
-- 
2.25.1

