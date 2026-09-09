Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F3455D864
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959650; cv=none; b=q5w+xjbqnlcnKPE0CHNjo2QsBNspjseci78+C2OFASpKMqs46Qw+Nj6l7Dar00WBNMasmjMdLlGK5Dw1LGFkwN1iuJLSiH+ZPDxrp6qCNydYFVetRValKv0WR3Cu/vI3z92sdeQ9WdM4rxDCPcr8ywFckSIMq3mhtriQWAOBR/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959650; c=relaxed/simple;
	bh=tfrBPSnwPBntwOURsH/DrlgfLQDZ4UyfPmQwS0LjAkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrBrFcHXC0wnEwGs2xGKLqv1tdmJIv+IVYPYba1ki+0786Gtc302XUuCIuQAYYri/YpWBYwL9VNwadw3/xrh376KRXGf1fMuX6zEqVwVmLZmQAI1fepXGz57xS86pZNX9aq6OU2+KxmRr6Mco4Sog08sUlWb4HlfpCtJg+qSmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABEMO/+8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABEMO/+8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso4263777f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 06:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788959647; x=1789564447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfrBPSnwPBntwOURsH/DrlgfLQDZ4UyfPmQwS0LjAkQ=;
        b=ABEMO/+8u6MdXIPqCd9/gXfySlo79YooZZdMWvzfd+e8co6mZboUQXP1rS286AutwT
         kAKkZS9Gf9EkUqC+mT7KU+eRBvvmmEBwoWgAdR/q2PtSuYeLmBs4+CXsQy0heZ3LN3X6
         vMazlRvk+7+HLlSSL0N5vF6Sm3Qwb9KXreW0B8Ka1ORkWcd5pX0b3yxS7+2i4+GnqLAJ
         rrjAfMyMDihjtYpJLYn332ttpOsirGz2aH/O7dBae0OGn2Udkyz8uqsLy6LacuHI4iLl
         1ELLr1XHCPySaxIA21li0A32y8bJD86qGawIedpd6r24gs20nzk1NUm5o5ycePpCR+jy
         q6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959647; x=1789564447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tfrBPSnwPBntwOURsH/DrlgfLQDZ4UyfPmQwS0LjAkQ=;
        b=hqn2E+1AVebZc0IN9g/+rFLbLPmIboI/lhntx/m6GzYiJBmbToZEuzY70AqWsBD/+g
         JFhUVOvBPjpDrytkHLE0mXWqCkh8QjNALP/tojb48G/MmfDvTYDNVRUcvbTwuB97RK1N
         lquT5MzzL+oUFbJAuUnWhi2gN31tZ3GjtYj+hw3jBRilqQrK895bK93Fbiiv7XkkhfYt
         qmWP/Bpy0W+802NYfB7dhcmuJOl/kPl2ng3bsek1rpKkj40PKtb2dD9stk+co4FTNqkj
         kCEjTgVQERSq5qxGc34fWpvdUTqVikxcFYIbnuKwG4aJ5PhmmtHjPHDAqLntrPR85VyM
         3arQ==
X-Forwarded-Encrypted: i=1; AKwUvByUj0GErtw5bdovY0aOqr9RKp1lfNkZ6CUNcOouCSxQLnYv7jTXn/eIBttqEHI7EiOTvmp7rVF/c3V1SQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k0SqsIg+sH0O0CqxViQsA1NA7QB5prUUThb4FU/0eYezXVHIb9
	5ylVvp58A/U0UsczpDgqA9Al7ryzu+QeUffLQCmsgUacje87UsSMJ0A1
X-Gm-Gg: AYBFou33DhBqTGttXuvu1TYu8D1EU/VlPIlC0TftltYSYmCvZCB+ahU0dQwFudJViF/
	pjVDQCeP7FjNUPuRFTb5mhkfat3yakjtrIbYytT3WgYJOoADy72OPdDqpEZPFmhmEy6M07HgYm/
	+Z5QYNrcnDGSeMHR1K/hdouB/6RWn3cOSrxm2OoFxH4/bKniaG7uTKlutj7LI8QY9m72IM9vnmP
	DXteWnF4Qz14bcfrqtN6mun3yz08DPOIhnZ8loFflyJC/Wt6SDHrTbnJ9H5zkdhtUlFeD+mjLvz
	oCY/UhT1LpW4UrNlQUyVTLQOk71z2+jISB37M/zey0kYVNokCfUmQJoWXvgTpu04hiZyzt28RcF
	0Oj/QCX04raXEEs0e9kWPI06I5VcGDneMAQCYIyJ0VcUyYpOhhuLQHwU75GeY1FbasxuR+sRhym
	12rfiWTHm0diFAZiOewSDOO5MG/mdlM7xgs1qjW9bdV2nBEgw0lfNvrF0GgrRcGEl9awIcbGjOm
	zmcpg5LB2L0VOKy29arrrDt6JqTS4z8ROhEpzOHYCXo7VWDNCmH3PlYgno5kC+T9Fo=
X-Received: by 2002:a05:600c:a05:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49cfc6ea772mr319402535e9.27.1788959646961;
        Wed, 09 Sep 2026 06:14:06 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm379749195e9.13.2026.09.09.06.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:14:06 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <817a7f41-832b-4993-94f8-ed926403b035@gmail.com>
Date: Wed, 9 Sep 2026 14:14:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] ALSA: ASoC: fix unmet dependency for
 SND_SOC_DB1200
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de
References: <20260909125636.3560050-1-julianbraha@gmail.com>
 <b15e44fa-fd2f-4165-813c-68f590ae02c9@sirena.org.uk>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <b15e44fa-fd2f-4165-813c-68f590ae02c9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 14:06, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 01:56:36PM +0100, julianbraha wrote:
>> SND_SOC_DB1200 selects SND_SOC_WM8731_I2C without ensuring its
>> dependency, I2C is enabled. This causes an unmet dependency when
>> SND_SOC_DB1200 is enabled without I2C.
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.

Got it, will do better on this. Thanks for your feedback, Mark.

- Julian Braha
