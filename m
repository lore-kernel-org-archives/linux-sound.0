Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157741F542A
	for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761321971; cv=none; b=fNeYXeO2a/jkLoFsZ9c8NZzks3oSQnpV/aL86jJ/SVEeyVofXdAvjqAuQxblWuLV5p08XKrx3wp2BWWW85SRB5PrWqGkzCu0abib6DMkKmw1wnzhbZcTACAMSK4LiVcD46VTj/ColWBrKNbuWF39eJbYtQVOfcHMz4gZmqHwCSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761321971; c=relaxed/simple;
	bh=3c7bOwm7cR8w0+Jt/bY89sbewv1n9qT9ayt2xE6Ure4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZH/Rali+l1NjVIy3tvBBnLQHuV3vuuVpLRVHiytyy/ucRJpqaxXjOU8FasPl8Vyxj1ZIIBqaVHoOnYfVCyC3KpNUdoAN/ZcyA5vuprJ5EYEPEaUPNnFSfmXHFkWS3+EadUD+ZVbSb+Rx/nKwlM3nbSUuyZHCaRViBW3ULDkbx/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=NyCS1FDO; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="NyCS1FDO"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-88703c873d5so83168239f.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1761321968; x=1761926768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqiQwabN7+SNaCM6YCpwJPboZ1StVYh2yuL/aC6ivg4=;
        b=NyCS1FDOuPoLtP0aUNpF/CqvGVZ5qm9FEFHxaSJiNraCm5mKwaHm64PnGQzrFKQNdw
         kFOtWeuEeF1ok4+Rz+CmA+I+Tr+FScD70gfzeGdazDQOMKFJ9cx0HNeW7Mtw4W3tUX6q
         IC8LVuZ2wV30ODj5sv+DtDNj6lKY2xNvt1zsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761321968; x=1761926768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqiQwabN7+SNaCM6YCpwJPboZ1StVYh2yuL/aC6ivg4=;
        b=vqYSVPqrgb8S1zstlGjze/j9VQKMugGsqWUrsD/h1uaKZ/raWE0/JOxa1j2mILYPvC
         AvGqtutoT/6GQ+oX6Bgs5U+SrjsezfwE+F2VP+kdsw3Wn+yG7OXwFF+KGUd0TzH5iOr3
         6Y/GXZDhuFCepK43CLIpw/l8As2GocpnG0QAgPdOmLHDSu+EK26YXu1w2xgDCVh49UpW
         IclXyJGTkDbzZ1CBPXChJtjUDacAyYBkimCvQgaNNTKzugIuYfP9IOqTJtd4v0UNa0m0
         holajqlnTIjAvkQoyfgfe3xqtgTGMYODFKeNL3SToOu+++tBT4efP0tGVxvBgC0A/TcM
         uoRw==
X-Gm-Message-State: AOJu0YzI1FVqaGRPARIolIQhWfBeLgI3VpEOTiXKXvJuSrdo0Ur5rexa
	IBMBzlblxDPb4VS9AxTyZElYVglJtFeZCzAf15OUV/PQEjn5PiWl4e0Y/H2UTTKBUeStpsdcauq
	by/Q=
X-Gm-Gg: ASbGncttbJ99NcnECYClENDL9CStIqNYDL6+4Z7IaU7HNrjq4ytDmllC/wBpAgBpDld
	WfLzThvMlS7GNvR1s/8RKUG6ODmpUcCjIyYlsXpjXidBWp9od3uAMJE0QDR0DA1A+fRRQkDFbFY
	b4RPUyBksHB1eQ5/SqK65ogws6IxxpdWZE7DWWoSmR3BmGKOrAzmKzlq0FRFOncoKF5p+mMrQ6L
	4D3/39Gb9WuB7YddT/GlTtQ7rEqtsAQJ57kKp/luj5wZ3iXWoTfaReaqBRhfToVnjX9vM3Bzp/F
	Q4iwS+1YisywiviSXiwS2k/a3QVGzoiZobWKWfdpRjlp1VhvdHAO0JEMtlD93sZVW9GF0VUA4vZ
	a9Rq8NESk0HleQtVVSrppv2K6RSPrURKVM63Y2PvmThILuLsCA/9UznMhWfzFGhw+W6vNkka520
	rLKsLiVoSZ0rNiUWEgTq46HxcMu1DMPottanQyh8GDzgiV4DXXZYShVGOYCRU=
X-Google-Smtp-Source: AGHT+IFmAZGPxYIrzjo/bVeYrd6msMNtUtiLRt6F5A4V5iIvDEZmEFUheqr1kCxRWvtPHxZLRSm8ow==
X-Received: by 2002:a05:6602:3426:b0:93e:8817:dac1 with SMTP id ca18e2360f4ac-93e8817de47mr3939194039f.8.1761321968049;
        Fri, 24 Oct 2025 09:06:08 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-94102f86196sm191322139f.18.2025.10.24.09.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 09:06:06 -0700 (PDT)
Message-ID: <eee35fa0-0a5f-4730-b6e4-a1b92dc5000f@ieee.org>
Date: Fri, 24 Oct 2025 11:06:04 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] ASoC: spacemit: add i2s support for K1 SoC
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, spacemit@lists.linux.dev
References: <aPtiNCZ_KBezL2Dr@stanley.mountain>
 <E26A36F90026E89B+aPtkgbhoPoTzVnRN@troy-wujie14pro-arch>
 <aPtmbe9uoHIPfZz7@stanley.mountain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <aPtmbe9uoHIPfZz7@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/25 6:43 AM, Dan Carpenter wrote:
> On Fri, Oct 24, 2025 at 07:37:51PM +0800, Troy Mitchell wrote:
>> On Fri, Oct 24, 2025 at 02:25:40PM +0300, Dan Carpenter wrote:
>>>      424         i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>>>      425         if (IS_ERR(i2s->reset))
>>>      426                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->reset),
>>>      427                                      "failed to get reset control");
>>>      428
>>>      429         dev_set_drvdata(i2s->dev, i2s);
>>>      430
>>>      431         spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
>>>                                             ^^^^
>>> dai is not initialized on failure.  Generally in the kernel we always
>>> check for allocation failures.  Even when they can't happen in real life.
>>> I was hoping they were going to make a rule that allocations under 4k
>>> wouldn't have to be checked but it hasn't happened yet.
>> Should I send a fix patch now, or should I wait for the maintainer to
>> revert it first, and then fix this error and send?
>>
>> Thanks for your report!
>>
> 
> You should send a follow on patch which just fixes the one issue.  If the
> maintainer wants to squash them together that's very easy to do in git.

Yes I agree, send a new patch, no point in reverting.  But I think
a fix commit is better than squashing (for what that's worth).


A very simple fix is assigning *dp to NULL in spacemit_i2s_init_dai().

         if (dp)
                 *dp = dai ? : NULL;

Also:  Why aren't you checking for spacemit_i2s_init_dai() returning
an error?  (Another--separate--suggested fix.)

					-Alex

> 
> regards,
> dan carpenter
> 
> 

