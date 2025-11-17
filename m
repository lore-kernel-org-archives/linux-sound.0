Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9763E32BF31
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390542; cv=none; b=NIl9kFnaJsHtrcIGdFocoq90viPhSkM+nkkCs/jNvA1+Z8HNJowH3pZh3RSqMme/09oBxviOkhb5UPvVyXrNRi8CFSuh9f2mCHhZAPaUnPkM4g6dXKDfAG39BCNQ0VbBGzv7kXcB7xhukbH5DPdFuhpap9qE6t4aTAfBXnrDAGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390542; c=relaxed/simple;
	bh=89W40YWNIGyCIyPTBjrk8DXEYQrkSQCsYCIk0NyhL10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5p5i+yyBe4YlwnPp4L6FPg8xFIBlsmDilCoN4yJUoLq41kqs846g6HwAVGXffSvXp+TSDqato2hVa+Vs9yhMAhA3Q4xuO7Jim5SOt84L1/SlVMpOzPLmqTOrDcoxvPgvHFwcBawc6eaXANKmiuchEqZ42g5TG22YDwS0/hsedw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qGemFVKe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qGemFVKe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775895d69cso23967535e9.0
        for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 06:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763390539; x=1763995339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VLmecC2+BXFzmwD/LAatR2XJYHtpzNF0QhUUU5gpbSI=;
        b=qGemFVKe9UXUtskV2MOz6M9f6gBTqWrh1pYki+1o+Qn2GKwCwVgUI6kuYJZY+/Dlnn
         NxGjP5AUpTidCsHCVLnUSIGR6qVEzVRN0OYk6r+syhRST45rCSh95MOi/UNVLQG+g5Nm
         2rHvwwUgbd2LEb2EAelLn/oNFyWpptP1FjgeQEzLJ1tb1B7XQRLQmw5uBK+eqZNQEr9e
         EfWGYCN7tFcVYS5tjjYbfJ6RqTZZakHeJY3QDNfmvA2JYzAD+APp7ImhgHTyZDc/Ga5V
         cYpelji48ksFqVp1b1uMvgXJfpTE8rNJt6EY3qaP/d/t020VAPDM98cLSvYvBA69AyS6
         10rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390539; x=1763995339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLmecC2+BXFzmwD/LAatR2XJYHtpzNF0QhUUU5gpbSI=;
        b=TQ7l8LOIlE+iFEZ9qqgfH4nQaWtxXmhj4y9KqkAyfayO9qEXbf42nlwqD7jao2NyXc
         YzoVafvLHLdoys8SBYJ9leV0jwPOr3GYmY/BUM7I2jDgGLXCopUhKOIHL+kYi5auZaSk
         V1qJdROB0AMi5osHgxHUVtQQ6Jp3xwKmYe2YHssDeq+gCur3jnUEznGtib/d4oAnQLQw
         zcANIbr9R3fi1cUVk2hx3KN2M7f1ug7yi5rqeQlzdo5QMfQudVSQwxo0OhUK3UNS8z30
         Xb3GuYGnADcOfy1a/VQgrfCBta9YDZXQRVFAnxAJ0f0sWgn01LTeGwP7AeFEqU/i52+i
         zOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg951NYtfZYtX8wSmJRbCeBYEojvNoO17djb9UoIiTnnxW5YK0foy9KzG4nKZqj0U5KvXhAMFeVSEhZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxowyVTeG21hy1tTecnHAXdzzAcnm3/DdcZwg6XeUB47InpPbzV
	gYx5cmAqKiGULICgWESkmRdC8qqnJF9vke6XUBnZSPPq4ZKA/+ola5Bn7vG+7KdCygQ=
X-Gm-Gg: ASbGnctqGRsKlwDttfgE4trYlhvhHVz38+4q/utD/DZWw5nJJyUP9m0jx3+dZiaGPug
	Qdcn2AOzD8PF9mWWF4uIJjCvhMe2BH6c6Jj5wNZ5B1GPZV5l/i4qz7bU+7aJutTVEgDvShWGI/h
	U6DpowmMx2cbWiQS7UCRbskjotiihJ2mzfsju2KCqBCZDf+rItp4Q5uzrWqjVbd0fq2JHGZH0pK
	1/JPhMclF1wUVa6G3ryGN0Mkd/5Bm7V4hRoRo0aEjQ7SE3yivrluZ1IirfOhAI0XWt93mazpD+5
	8iYY/nTB/SuVpNoA8xH2+LdNnK1Gz+qZVOQpQaJOFGgbFw4uPHwCFl34u2zDPeEm09RUDZFl/6h
	GHTgt2pR9GnXPLtd2ewn79GeXpydugY0BP3E6dBpTN+MTvNpJLT/tmdS2+enBLIpQtd05lfFFii
	TS9xVlX0aq39749tBO
X-Google-Smtp-Source: AGHT+IEopibZwRWUzxXVuBtBJNCpF0FKrGlRVYkQIBPXxPUWNf0AokTtqdf42+oXkDVSZ9y/83Kqjg==
X-Received: by 2002:a05:600c:354d:b0:477:54cd:202f with SMTP id 5b1f17b1804b1-4778fe5ed04mr111100355e9.3.1763390538722;
        Mon, 17 Nov 2025 06:42:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47787e8e6a1sm301365015e9.11.2025.11.17.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:42:18 -0800 (PST)
Date: Mon, 17 Nov 2025 17:42:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
	ckeepax@opensource.cirrus.com, mstrozek@opensource.cirrus.com,
	yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, navada@ti.com, shenghao-ding@ti.com,
	v-hampiholi@ti.com, baojun.xu@ti.com
Subject: Re: [PATCH v2] ASoC: SDCA: bug fix while parsing
 mipi-sdca-control-cn-list
Message-ID: <aRs0RlQLRDZwjlTS@stanley.mountain>
References: <20251110152646.192-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110152646.192-1-niranjan.hy@ti.com>

On Mon, Nov 10, 2025 at 08:56:46PM +0530, Niranjan H Y wrote:
> "struct sdca_control" declares "values" field as integer array.
> But the memory allocated to it is of char array. This causes
> crash for sdca_parse_function API. This patch addresses the
> issue by allocating correct data size.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---

Looks good.

Fixes: 50a479527ef0 ("ASoC: SDCA: Add support for -cn- value properties")

regards,
dan carpenter

