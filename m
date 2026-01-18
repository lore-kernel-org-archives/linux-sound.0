Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476E022D7B5
	for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 17:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768756079; cv=none; b=V1IkegmWhhcAqGDBzCpQyuYzFvcKFUmiNZpgVv4AwoPunNyBB4+rmjJY81lfr4rNTuabGCyypOEKp7ca0agZXDGIRbE+84GteXqTTZ8Feo4iSbJAX5wG2qydmK3cpgjC3AsI69pyZSLi2v5UvYbfC/nXccKtH1VWgGonc2VPUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768756079; c=relaxed/simple;
	bh=wqJVTf+gmqQxz2b5iZXHl+d4EPQymaMDdRoZo/w/TXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBLaSEUlZRj78MrHJIhu5+YK/ypcoNYEeR9OTBxES3y2LED6ZQG5Qs82+KvwTDfP2XbkCw2JTWlxHgmwVVJBN6IW65nFsXIYeJatWG6w8ZCtewAEErn4HDomEmDqoJxWmbiO5g7hvlbssX2AYDtt7dtW5z4V+OAf79tiW1wy/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFPD61ZL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFPD61ZL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so22813345e9.1
        for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 09:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768756077; x=1769360877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzZkrvjzl8CZXzuYp4FhKjj0g1M3FRzGDlc7LV5XfLI=;
        b=SFPD61ZLctQO5g9gq4cNw+MIY71ZCIqhLvVmkH7HBEnAk8znpNzsXKkXBoPfrdrbO7
         B24FSVjMMdirKvJ8aTZAaLoT83kfZ3mju2LMSb/LQ8yp7ECD9Zh58zSt0OMwW7xEdNc8
         M2iJJKpvmQBaH7j8hlQVNcByQKZEn+/SOopm8HmEIiU8axw2EYzDEVW9XdgnxHlstnxu
         FcqUd+jZB3bZgZR/uLazIqCQbVHqqw5akmSiD/6Pyk80EdQs5LxMWe1QizXh+SMJGc+p
         +z55Bq7HUQyrepCrESOmkzM7Hy8SNqAPOq2YbFKQPSgbDBKfNqo2f5/DohM9JLuD3OA+
         4J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768756077; x=1769360877;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LzZkrvjzl8CZXzuYp4FhKjj0g1M3FRzGDlc7LV5XfLI=;
        b=Sx0fvIxkbrUAd2MpKqaVOFoyjgsWEFBSB37nqNGwBjp0cuXVjMutdR+NSnnYse2WBH
         wADi6HCb8kMIqGR2PNVGjC/y3ffZxQqWMRRQK9hGbHgyjj6gZa36aTRe2F2qB9OurgtW
         ZvCA5x2q+LB7sEL36dLf7a435aEArIz50/06PCab1x/mpQ6V6ghlTk/2e4Ud9YoJdu9C
         bkyAbv6cQ1jcj973TtRlcEIzUEDdj52v6SsB93OtFelNKMEdG1gw0hwIc+rZ5W7ulG4c
         D2mut2DE/Xq/jCRWBl1Dbt41ZEd3Fm4k+IuGZ3bMfOm/eKIi79T7miWGIMGYibFNvaK1
         dZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHRZ/ewjPV2Fgu3NbwXeuOk9OGnLt5r4hvbJjuf44fv0ECtCj5BCiXgpZRfkf7lLzLt4heG5q4VY0AQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9brorEpmg6Txgd9C+CdVMUPHBErTGqNJZc0VWVgQM+WAjsUIX
	9uPmic2isynQHxWQaatKNcFo8/XEZW2Yd3i4dHwgJvIT1Mpk3ZHQlJ8D
X-Gm-Gg: AY/fxX7IXlMiPYn7RTn0Y+2mMzVPx9golYa3CWEkrBj47SCrT7VP8a5aulF1DSsD+EU
	3Hzn2RsBSHlz/20MHj/W9ZANWYGNAe+4vFmA8vIabcuSAiCkWGgmAFuEwDhZ9/Zui+s6lrA6RHv
	3kqycnU7T01OMhXQl9fmmlVEPrI+S5LICfUkDunEiQBMNYl54FlDpvdCDi0a4zg4Lc9rn41yAHx
	FVQ/5hX3p3rQkBBXupfOAytPWn8rNESwnqK+F8lWBtx1Imklatgu8u1T7XO0M30K8Ke74/QuqcA
	qPicClptSZ+QhO1PA0WfbAfRRtQE+LSv4hQEuUnduvirbTSvwLW7Hpd801K2I8oMNyFj3knnChI
	UcZH1ulRLqZ8KzJ1vYo8rIFoD8NdhzOhrnne+2Ww7aHV+QsJBUFZmxnw4nziWBAfp5uK3uRVt8o
	kGVjwQQs08U+jyuRO3/iUJjjpvxR1hkK6l5cyNlNCrv2I=
X-Received: by 2002:a05:600c:4e93:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-4801e30b737mr113177375e9.12.1768756076408;
        Sun, 18 Jan 2026 09:07:56 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe03b56sm66590995e9.4.2026.01.18.09.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 09:07:56 -0800 (PST)
Date: Sun, 18 Jan 2026 21:07:51 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aW0SikDtd0HIrT4v@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
 <20260118-famous-magnificent-peccary-474ba8@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-famous-magnificent-peccary-474ba8@quoll>

On Sun, Jan 18, 2026 at 11:14:34AM +0400, Krzysztof Kozlowski wrote:
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

dt-bindings: sound: sophgo,cv1800b: add I2S/TDM controller

Is this anyhow better? Also in the documentation directory should go
first but I didn't find such examples in git follow. 

Thanks. 

