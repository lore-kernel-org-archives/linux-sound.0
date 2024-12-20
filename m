Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE26122ACEE
	for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715664; cv=none; b=KqIubQi5jiI6VCnhDOJ2yIxOq6mUTyLywZieVZQJN6NqiuU8Dcn0UN6HR0MxjhS1mNXzt07vISALBQc1AMYptK+q/rwvF/UTokJtBcyo2L2OgeAP+/bhgy4D0pEf8WvP0Zd+bor2Fw1FkscqPCsXxwPtnGws1jz1nPdnXOD+p/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715664; c=relaxed/simple;
	bh=f39usLALOQXGXkbRjF7qz5/fa3n0OkytJo5IeHtjbZ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SHI9dU12pjxJP/lO2dlYwgY5eRHJJx4QL29xZrpbxtht1Ctx9acVyAqmOfVLYSIkulBnplR78R/h9Hq4sGLmqyMQQLhmer6sHHwTsogMnjRxAOlsU6ZBU2TEHNun44uMwrLjhELO6X3EYHa8/X9ZgmUrPzgLrglqwztROh14bFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=soZ9ZYfY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="soZ9ZYfY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1254787f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 09:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734715659; x=1735320459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBdx38idi2x6WMKim+iQ0Y5D5QPXHwm1JSvl9+02rc4=;
        b=soZ9ZYfYPJJsrHdsmWxLrVAbn3PIcf1ZPRYD1oGH3M6NqvseZk7Uy+lHUM+hXdg3XY
         vAmLStXR6iB7pbLuCiXiBA9vWxlSMCd1zPsf21hmN0ZPbweVSq8OUOPgj5y7v028Rc2e
         FbJPjYWX/+vQzvlPY12altp2qyS1n1k8ht/30Dh2BhHHjcNCy8CuMt2j5aOyF8eSN2T3
         SnqRZ7DzquPeUAvSkACKmSgx1yqX3vLbTGYtPC01SprRcdjsCOy9cFYram1hBV7Iq9pw
         32GzzE1T449DQ9p2qy1h9IxM5zkAZpQk8Hi/IZu6nDPaFAdTiCt/OUoG9pH1E3wmh8eQ
         oHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715659; x=1735320459;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBdx38idi2x6WMKim+iQ0Y5D5QPXHwm1JSvl9+02rc4=;
        b=TwUvg+NSUkquYMnGlzcMapNjpg50sYshh1X3zgztwx8/5lZHe9/73Kdpovu3NOmLUZ
         ulU5jAp+Cx0kZk7nNLTrgp/e9rsW9Pc21+9oVtBF1XRywQZaw+ppvMA3UKK9Fkjyk6V1
         UnFPf+lbDNy+lbvZZhbo8WK9ezvWHquqHAB1hPg0wQ4U8JuPAZNF8NSPq9116pVtEiEN
         2kFn/5/1ilS7fn4coRkzeZVUt6N9z/fS+KR+Vsy51R9NNq7faKx0rVnZqhsWH+kZbqcU
         50AfA3+LBmmI87MjxVC+bUowulXBmM42KpfRXHf3yvASFTfvjxFs4aPF0LkFCjpVnhq2
         qRCw==
X-Forwarded-Encrypted: i=1; AJvYcCU6giIxqPYx1toGXZOz0FZq52YKO1X32EUoZMSbhBgW3vQbvHl6Up/XOG6GdD2hapO+0HX2q30GXxqO/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1VyJ/bMW+vFG5r4rQoUtJL4bhlDjMGqEBCySj9P8RPHMKCFI
	vkeZucV4pci0E1mz5qnt80IIhe9kZ5I4FY++l10YR2uGgOolSQ8CIdwNtMRaYbY=
X-Gm-Gg: ASbGnctHiizH+eeW2xgh2C9HxzhyZFiQoyyRZall8l3hIONRWDx+bhxciLEwIdn+68q
	KHrk++YYY/5fv5YlUdx7zd7Zj0JROFla3DATgRotuWBTSPM4yVNawrekUK1ds2XD6cQjCl8NEXq
	ywoxQk53mwNNvbVa3hpWbI+D+9U+PB8KbhNTYd4FjoBImrizLHlw+5JB3+usppsVGYGtUWiGDiU
	fny6hhUGJbjoX2Ba8K9NXpGfMr5JqdqXsXjr+fAWjZx2PzBZCldBtEBd9QyZm+KMx+bUUjk7cc=
X-Google-Smtp-Source: AGHT+IFuejYCOH/GgWsbBBv9sSNzN2QZBnIDmhk7NiyBkMf1oumql2iFSB3VSEQs/j7SbgqF5zzsTw==
X-Received: by 2002:a5d:64ad:0:b0:385:decf:52bc with SMTP id ffacd0b85a97d-38a2220088bmr3486679f8f.32.1734715659106;
        Fri, 20 Dec 2024 09:27:39 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e357sm4642915f8f.72.2024.12.20.09.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:27:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: corbet@lwn.net, anish kumar <yesanishhere@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20241104045907.76298-1-yesanishhere@gmail.com>
References: <20241104045907.76298-1-yesanishhere@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add slimbus documentation
Message-Id: <173471565835.227782.6594510444365392984.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:27:38 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Sun, 03 Nov 2024 20:59:07 -0800, anish kumar wrote:
> In the commit 202318d37613d264e30d71cc32ef442492d6d279
> slimbus documentation was added but it missed
> the update in this file. Currently get_maintainer script
> is missing the main maintainer.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: add slimbus documentation
      commit: 3250c9d6a6081d33ca01910db69f1fc1df46478d

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

