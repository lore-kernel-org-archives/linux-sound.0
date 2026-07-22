Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120C04399D4
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 20:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752185; cv=none; b=jI3xde1iaWfShj+GjFPiAtugPwW5vw5bUX+5Tr9RnWSSFwdAaLN7teboAJwUdLgRxkxdQyQ3gYCY/6Hb+HkgPJfvSbWZkDL79A7fx4hXD3SkVcqFq8hM50X8GUeItb1cWuy8F4Tfxumly25Yh5VIbdDWKG9qy14sfk/VR6XPyBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752185; c=relaxed/simple;
	bh=GJPIpuAYOH/Cd72F8JXZljndf72BGP41ynlicTsSZpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElQH1CAJ2GRlC74HfYSPwUn3KUFpCAy343LmFuJyB01DBub4WfnxPMXGE0+WJpGwXdSq1f4TPoRnWu0PX55e7RmY2r5o7DrfM/PRUuN8c2NYSzEDp1nTkQUjrWKDnAa9pT27ufJpMrJTAOv2ziho9ku045hivT6jJ5BGLj3ggLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVj6vpfs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVj6vpfs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso29271455e9.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752182; x=1785356982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJPIpuAYOH/Cd72F8JXZljndf72BGP41ynlicTsSZpc=;
        b=YVj6vpfsHVUTgex0kjgtjlXW+2qU9sKjauhrevC1m0jze73Y5brKVbVr8fTOexZzbz
         QNhWoT2lYPwAB1dcbOII0Vzi/3iBlotuc6xwIbg//Z52C/N61y/dNykPk9jrKfEt6Wke
         hCeeU8e9i4J0TacJJEZ+CB5hvwsvMl/twQ3QGt90sSVFWCyOmbZTW+FtZSwr8W/fBK4q
         A5Lh4tIwwKrOCWSw44K8wTff60NxMn34L9XOQp4AovB7qvCPvUbZHQmeHMA5bNM0sJ0N
         MN9Y8RUhjOQWapUNgN0StlAsekorRZFfvcm+7NgcfGj6BZSF+Pe96bdHLuD+hnETc4GS
         IXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752182; x=1785356982;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJPIpuAYOH/Cd72F8JXZljndf72BGP41ynlicTsSZpc=;
        b=DCEw7cT4Dqocw0feMFiz0s3S+3/ktIlWoSACyT1XyYSiHjVOlGsgjEwFReXSuc5Vx1
         PMihajtGPji/aNPDY58+/a2Kt2idDOhivJWSwregKvTUwTFKrxbtp1YNFfrd9eJ3rXMN
         E95bnHXEE2CIjfGG3sEzoNvNmjz/IW6SD6ndNWPHs1bN0vP7IzMD/PEnjG9/KVfKqZ7C
         vzgSMqOr2+vVhwtDA7U6tvoqbElencZG32s9sFfrM63H0c5Y3W+A4YCX4z8M/ykUrsN3
         wZko/MVw3Xpn2ySaoTAdE5s9xMMiUZ2tJY/mOk1R9aZBGIYTr5+KeI6L6KNrfxDOS4BR
         4YvQ==
X-Forwarded-Encrypted: i=1; AHgh+RppdFfAXmbNvZ5cxSi7OTRoR5+KTL5FwhfHJk4LSYYciZlYSbC0whNOEL7v4HOCi6KuVYAnI7IodHkCkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgDdwTlIFLoLVd/UDeCbX5xqsXtFoVx+nsqGwlfVf86+F8+6oW
	G0gJQo3tXZRMonGiAvxdQUw4Cxz3s/nvugU2p7iYdHhX6EbQtB2zZazo
X-Gm-Gg: AR+sD126ych6d9RjJHO7rm8Xx88az7qPfphRSanK+h0qOtXVZzq6NP9iFsMffyEqvht
	dJZ25zLv8iaZkPw7veGKCwnTaL+KaYMw4GCfsetLn8Ua4+nGGleBjM5Vhtmnqfx8xYKUD+yOSIo
	GC4Uz3T0wRBL/oJTkm0QUgNYVhzBiIs0MyYdojDvx/F3pMW0/zc8uVnxdyRtCZdO/s83vezmnyw
	asxF23IKPXm2VA5gUSR1MlisS6+6I8W9gfKPAfN8lDWTxJBHqXE7/GYRMXWBVU7atUxRosPMhI8
	53zdp5ETkWDTESG1Q3e1sGiPMbU2/Hz0Fcb7TtUTNOyAfm3ncmacGSNmIddcVe1OFDLZZrLDMzs
	4JORREEuFnTtTkpgxbSbK38PhfRnE0hH5h3EQrSwpZN1UukcYjqH8Ci0lHsOLkIk1DyevF90MVI
	SoYKbbmKsPXuxsPTg5adOA/Sw4sUaIfCgrRp2Gi7XH6zRH1DAdCz0ldQF5bk8jUGxTgfR8KHqnA
	Y2smlYW
X-Received: by 2002:a05:6000:18a2:b0:475:f0c2:5afe with SMTP id ffacd0b85a97d-47f8dca4f76mr389618f8f.52.1784752182154;
        Wed, 22 Jul 2026 13:29:42 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a6d7sm9453665f8f.2.2026.07.22.13.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 13:29:41 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <194de1d4-6303-41bb-925c-dae08d382bd4@gmail.com>
Date: Wed, 22 Jul 2026 21:29:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: fix unmet dependency for QCOM_PDR_MSG
To: Arnd Bergmann <arnd@arndb.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260719022242.139472-1-julianbraha@gmail.com>
 <qhrevlgsup5xtnxhhmon5cjic5utdhc2mdviczylqesw6yjjzv@s3kk2dr5vk7o>
 <de25fc15-f438-4f8c-8c34-67b10dddab12@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <de25fc15-f438-4f8c-8c34-67b10dddab12@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 14:54, Arnd Bergmann wrote:
> The '(ARCH_QCOM || COMPILE_TEST)' is probably not even helpful
> here because QCOM_SOC also depends on that.

Nice catch, thanks Arnd. Will send a v2.

- Julian Braha
