Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B89385519
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192940; cv=none; b=Mt5JsPllq3XIbQ41Z8RR/kwrahMpBXVo4oPVvNQuUcdOm9jFpCbIKrtR3h37P0gTnlJ3VyHWm3GA3YbaVCV3nRoViA7+DXORNM4W7NvNqPn5BNTSW3Yo4j7oZVHvwtn6PgYZL2FpvbHiXzrh91qik7AnbapvpcHyrZjTtDtZQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192940; c=relaxed/simple;
	bh=JnU7UlQSbchu2TYcv0iygOEto1dGJRIqdXNTolT4xaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxGXCCtfL47kqoi0sQaee1sPIGEaM82dzgxSB5/wRjt9ql8aAFHN7CSbtAz2XcNSThaS87yggWSBjOSwibKSlDr2YY2BI0jyCNqCmRrw+yTx7na+vdxQ9Y0y8RDkx0T6bBuGbu6a8/pw5CJVMYQ96KnhNhvr7XgUXGxKXvRmob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auGZPALE; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auGZPALE"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848882fdb18so3272159b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192937; x=1784797737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcj/2QWjWsxOQT4KfGLw5iUUwUVIUq7Ov2ZMhZrhSSo=;
        b=auGZPALEpBILaqn/rjPpBiodNTJrsoViTzgj+/+sRawC0fps402THHy9YhNE1r8rf/
         QIErs/rEIcrMhXUIiSyB/w59QBt6NcIlz6O3w6/wd2A3jJ0PMM4d32mXlhgW688mCA+z
         eWCuaUwosneXkWFvISr6GmKfOJ+SpoAxbNwpmJzaoK8vypIM9iMezXmS/akMs+WuMhTO
         5VwEr4mTdKyRsFkKBPf0+Mg0lV/lnMvCYb++GPRnuvPJER+2JdlQaOisWYchhEEcuU8r
         l4HSiw4CpdQXm1QOoZQ5Hp4GLVzMeXFQcFyCbpzZKAT047me4GMbYIxFVkjzvRwCpd4y
         jGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192937; x=1784797737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcj/2QWjWsxOQT4KfGLw5iUUwUVIUq7Ov2ZMhZrhSSo=;
        b=Bk2WhXm3NHi0pCaJcjNOv1WKZtXFoxqwhOw+W6E3KbE1zfctAags7DQJpoX3sk/WK2
         kAMgU/5ad8CC8KG/70VNbeAWfRp40HkQoJXCKcYl1u/08ZnacADsBxDeyPaPZnGkZBhF
         evbhQvTH8Ga9qtc9fruhntKpFXRif/cSSlMSH5sbRKWJ5BCVT0hgzEvybl4EzXW41ZDi
         EzBQmXgBJEY3CyDbglvQjj9Qpzdl3OzH92dOES8Nq/vur2qiBcQsNdSsGELISDN8cZIp
         /krVvkqFm9heaSRsFNgtmn5UmL7Z3KL0NjhUznJb01IW9WinEMmshIK7zUIm1M5Nu8or
         oXUA==
X-Forwarded-Encrypted: i=1; AHgh+Roxp9rX04t9Tc9AHd9RfNMb6ZhKNr6Uwcq2pBqgY3LtBqBfM49evxvYrVfgP+B1jkzypalureV8hSIp7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjso7Y139NsfiLroX6osHrNsr5jd3BNzTD6mMufXRcO0IvtPWV
	2S3fkB8NuLy/ZvpvOmNsmOI+l//DM4gjxy3GmajoTb8LVTGQegH7YxXP
X-Gm-Gg: AfdE7ck4GJnwbqa1rrKrtBsChYT3v6oUz0kHRYMmHupk8U8EdcfFdG5//cNxZi/NIHH
	B6MvZQnWYyBCcI2RIUIGuLRXeAsDe5ndY32WC9Ya6zZtfgdi/5tlcmwGvG5UGI2NLhae9OU6/Ur
	hrkiLqOwGVyb/ZKpB0o3pr9wF0mug2jX9zRDozWew9RvBYNKItMwCauauGHfg8XwAay3DIwv7aS
	lcA5DD8iCVox2/9VhEiTLrX4NrESEYbO5Z8SfpPE63zYEmRP68OtK3dpOzAgwibgR9SH3FhaKxu
	KfxdyP4ANCJ9McTh/nSK00nI/KGQSr7+1kWJqCcXud7QIZfMlCA+m8DgTvXGYooEjclR1nRentp
	hXrN8b+m3fH6lypoHul/zRZZ1h8aMa8JjNfv2n07x02HDSNHQCcddS35J1DFZ1JihuezKddPiDs
	R8q9oPtldXPVPwDV91PJpR8O6MzkBjqFA1yvE2
X-Received: by 2002:a05:6a00:2341:b0:848:2f84:f429 with SMTP id d2e1a72fcca58-84a6738a72fmr5729566b3a.66.1784192937232;
        Thu, 16 Jul 2026 02:08:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm4511800b3a.29.2026.07.16.02.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:08:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 03/10] ASoC: ti: j721e-evm: Return the original error from card name parsing
Date: Thu, 16 Jul 2026 16:08:22 +0700
Message-ID: <20260716090829.72082-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716090829.72082-1-phucduc.bui@gmail.com>
References: <20260716090829.72082-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the error from snd_soc_of_parse_card_name() directly instead of
converting it to -ENODEV. The helper already logs the error, so drop the
redundant dev_err().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/j721e-evm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 312298e0b004..600897a3e1c5 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -870,10 +870,9 @@ static int j721e_soc_probe(struct platform_device *pdev)
 	card->num_dapm_routes = ARRAY_SIZE(j721e_cpb_dapm_routes);
 	card->fully_routed = 1;
 
-	if (snd_soc_of_parse_card_name(card, "model")) {
-		dev_err(&pdev->dev, "Card name is not provided\n");
-		return -ENODEV;
-	}
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret)
+		return ret;
 
 	link_cnt = 0;
 	conf_cnt = 0;
-- 
2.43.0

