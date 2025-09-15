Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EBA2417E6
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757925593; cv=none; b=b6xf4BsuC5tC7OIau0aP/MzalajNeigU9s/ipGY8OvuIWyelS2Q9Rjlm8iV+hhybhziKA2JVAMckJ+B0QPRxKXBmrY+ObSPUkIUFYzizTg+9rUzyXzOwgqe2UVHD/qw7cxp02418pPsKV2TPV1VZxE0PRyb3lL5bT4OhudX/P60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757925593; c=relaxed/simple;
	bh=Ja+DWURKVC/MhjrBt/JOedxNP3etC5XulOORUTF4wgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dv8tW6KzR0oAbjdSZTK0GcrxqbxpgXG2UsVhRuQI8NAZ/U4Bdxwbk5wu/TA6SzLNpAY/XofrgCXMd3Qt2+mqFom/ycZ4ac0qFrmh9vKT1kWtsswMsGIjcP9ZIHc30xpp+1Uv654OhUi81MHugl9sOdPkRmbhuOfBZY9iPxDVyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=asYBn+zG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="asYBn+zG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77251d7cca6so3667915b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757925591; x=1758530391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jEX9XijT6dZdXfDNPrPyYoF9pF2to+I4KU0mZQv7Zoo=;
        b=asYBn+zGUNoQjOHi44jaWV5WqQDgUAPofDMhJ23uVkXSKfnYMy2UQ5dggH9hd97B+T
         0aS1+z9hLsoLpNYQSHOzN5ZbvSvk8gjbTOn8X+3ncfB38bVNa6djj5dq7KKOqPTRgR2n
         FvyDyrrCn6gj+MGuj1Bdihml88jR7nThjLtbftfF4Bzx3AHA0CjzyKcsE0I5zqMRILJA
         1i79KwkQMpqSentWGFPPS8SFNjoEw4m25+YcOinJ3A1K4/Gr7B1mWqpdZdnnOUYwH1jm
         GB8/nS0jTf/KDONuRr6XSzCeGovKAwo+5Xs7bULFki/q/wTQxbtosgJvFfl0Qib6qPfk
         dU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925591; x=1758530391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEX9XijT6dZdXfDNPrPyYoF9pF2to+I4KU0mZQv7Zoo=;
        b=NqseWED+u+mwGZhQZmpkv6Jelm9NXqJVszXTMBrG8lRUnJnx0YjQ8AFE3uqxWCBt7s
         yre/0PgdQ0R58ErElgPPKhIwtzjunUnTaPxh39L73/zthLru1T5Sn2W5K4msmvswX9DK
         B96DqNnpK5bGFR+CDDPRpARxvqCVPFNjIAkHbSfYkIfR6JqcMg7UAbd/lDpdk+BUJasO
         gERw678QsLCB49fioyHiH2+kBsLwmszMHWi3AFApxjMdceI2ANlKVO7Rsp+d5/rcLnNA
         fl9YohK6mTMbpXafssU3U4RV6b967JUbLWGEs88SKd/xLpUjAhOEMWBZFpA9PZJCzHXn
         WxpA==
X-Forwarded-Encrypted: i=1; AJvYcCXswfS5CslOTOt+xYqAdSkrU4Jr4uwbjtbav5JAr5mTwqpW9orxGVQiKsoeyMJWo1yd5oJ2mqBlB0TgGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpDY1MOjVD5bHfCnRicZlATw4nafwkwWNKbbQKmB17CIcO1mOg
	398sE69r/IRAns1wUldC8g7eqFzGeOhK+5moBrfwMN/Pt8dhuCrNEMQBkyXg0wQAESf3boQH8oF
	MF3YB2o7f7phvOpmdjSBf4PZ85ewyeeWam5VeU8HK
X-Gm-Gg: ASbGncuWjOdaq5R4pkjjQTvY7ZscSPwnio01oDfyxGPU0QL2fX8Ckw8KLTYC4HqxCXS
	AUp3Exh6AlZ8KALx4xGOCctEJxMAaUnZNJwniB0qYFEyUwNx7qn5zxCSDIiLNhptiAZk//bAmOI
	upXy8RhggTDlNbjSnQ4xwEMD/95eGpFBNJ97ttZLilIAQc+EX7Z6RBJx97Z4V3BCKlxM/+QFH7R
	K7ybldRcR6S1uF1v8udrF9hgYxH1Wjmv5nn0yM1XA==
X-Google-Smtp-Source: AGHT+IFQWa1Lq5s3wHqivhZWy3fXCUWg+0nXwEU0qlOA4xFoXSjxKquMoaAEWKKfO/WgYI37H9Hf7stft0DUGFXxn+A=
X-Received: by 2002:a17:902:ebc5:b0:256:3dfa:1c98 with SMTP id
 d9443c01a7336-25d23e13e2emr141646225ad.11.1757925590740; Mon, 15 Sep 2025
 01:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905091301.2711705-1-verhaegen@google.com> <aL5t33Ztwse6HoQP@vaman>
In-Reply-To: <aL5t33Ztwse6HoQP@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Mon, 15 Sep 2025 09:39:23 +0100
X-Gm-Features: Ac12FXwunFCBoJSIg5TZc6taVzPDODNO9kbuJ_l3vtZMfjpWrOJmHmPUWle_GzA
Message-ID: <CAAntYmJbFo+PZGVamNYjOav03UrZ0i6a6fMiRdfTJ=LgsHiCZQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] ALSA: compress_offload: Add 64-bit safe timestamp API
To: Vinod Koul <vkoul@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 06:47, Vinod Koul <vkoul@kernel.org> wrote:
> Please updated tinycompress changes with this once this is picked up by
> Takashi-san

For reference, link to pull request:
https://github.com/alsa-project/tinycompress/pull/29

Thanks,
  Joris (George)
