Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2229D5FDA9
	for <linux-sound@vger.kernel.org>; Mon, 29 Jan 2024 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706529148; cv=none; b=DmefwpfyTpOWncdMBMJl43pbC4umgdxf4qUgpkM9+XJX8haFO6jgmbl2sZRJ5RmanPbsPAdsDcarOF3MHR62vxEDIOzJ5h64ZvRkm+7h9umKrnwt5f91n6kEa6p+GIVR+fmhN1rKKVALTA/ITO+yP9mhHb4tP6aqk+flW6jCs+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706529148; c=relaxed/simple;
	bh=OEn344ksEcO/KPuz03HGzt0LbiDtkFUUnDPggKZSm1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nxMjYR9YWtBhlgxqySjplQzB8m5+y3x1y19Q9IEcUsFy4CzFvf4YK5DXe99SY0w0UYO31FbzeuUlo+Tt0qutK/zLIMZ2wprvfXXkpK2fhtubAlfHD1BAXkw0vTjkmZh7QA/stjynY+0f2I2+bcPa5wlNM9lNPjR+wv6CflvubSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8b5OvvT; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8b5OvvT"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55eed368b0bso1897564a12.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Jan 2024 03:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706529144; x=1707133944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDGYECsDtIdBMjd3oPDwhe2eE52MgTh9xNyzExOhMAs=;
        b=q8b5OvvTa9f/RWb3NGXpsnBIN2ZgiYeIVf9OiHYDkvGk3hdMutIWF1EEh0rhj88h/p
         2qFgExwNkb4oulqKFs6czWzjC3cXWChiC4JqaY9jVxKw357DBmGHT1P0g1AAxWqBJz++
         OXxva5J+BnhHXYQ4Q93HfBXgCxWOSyp2I9XkdWG4rKz0F2PB35O9EtOcqN/AVGXGQiRx
         luSDgjkBSCfSE61fay6OFiwbQnqLIPzqXGwqtqpoIKW64LIIAfs0umYxmAKR5V15tB3w
         GRtsA6znNpxcFUjHdBoGIwkNq3Gck162ZvRj6/ykFJkIZ4K39HwMbOdA+7DLdfDjkd5c
         sEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529144; x=1707133944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDGYECsDtIdBMjd3oPDwhe2eE52MgTh9xNyzExOhMAs=;
        b=QTLolQfcfCth2UX6cXctViNQDhRmsQhc5OnXEJGauEHiaBuday9C4jbUBpLmCMBmhR
         26i1UAMsnzc/Ybn69zpft4LuOED+FvG8ZW3zvtO+LChmHTjMnJ7Dt2Eap/qQnqrkqojb
         Xiopzppi7uADMXQATChrjBkHZuKnDQ0nmUFoUKnslCbEw+gAcnKLanrIlYisnST/EWTJ
         0VMXQj9dIZo3JFfn9zJJRXKACmxiVGxUUwJ9Ufu8QeJPKP1ZJq9mDbPB1PBNgNkAzmqC
         QHfGzxL/pLXTcbln4sKXVG0nrKRvP3UE96aLfNmb1Q/rsbvmR9sLFYQGvDxme9zC7Wz+
         ro7Q==
X-Gm-Message-State: AOJu0YyHqVFOL/K91fAT2HJESZzk2TuVPegh37UKlbOFqomKcfnHVnzR
	U0QvIidsZfH60YcbhCOQscns+b3lFsn4qJ8zuQty8YPstbIXQtoNjITXRH8uEiM=
X-Google-Smtp-Source: AGHT+IEQNLjhCr6Kx84OvaKLsougPYvC2/GgEyXcjNLbL1aCexWmd5xdUnkglSvejmamCtxIHbvojw==
X-Received: by 2002:a05:6402:2711:b0:55e:b30d:d845 with SMTP id y17-20020a056402271100b0055eb30dd845mr6121423edd.17.1706529144550;
        Mon, 29 Jan 2024 03:52:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ec19-20020a0564020d5300b0055f29ececeasm19907edb.57.2024.01.29.03.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:52:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 2/6] cpufreq: do not open-code of_phandle_args_equal()
Date: Mon, 29 Jan 2024 12:52:12 +0100
Message-Id: <20240129115216.96479-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use newly added of_phandle_args_equal() helper to compare two
of_phandle_args.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on previous OF change.
---
 include/linux/cpufreq.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index afda5f24d3dd..3cd06dafb04b 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1149,8 +1149,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
 		if (ret < 0)
 			continue;
 
-		if (pargs->np == args.np && pargs->args_count == args.args_count &&
-		    !memcmp(pargs->args, args.args, sizeof(args.args[0]) * args.args_count))
+		if (of_phandle_args_equal(pargs, &args))
 			cpumask_set_cpu(cpu, cpumask);
 
 		of_node_put(args.np);
-- 
2.34.1

