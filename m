Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA3D155A59
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 20:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723148425; cv=none; b=bY3O1E8jtoSZpCtK+LX3NYd4I0vh0JTv7qhjwn/+OvpZ+otk6qnQjq0PpvLt9a/CJqmhgzUjv1WCM/iPJdClB3DfEuZNhtezKLWoB95wPFesGfnVWJjL6XW3MJNt6f1fq/x3yGvaCzIistYiZT/OXtvxISrjaRksE/V6pVLoGX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723148425; c=relaxed/simple;
	bh=I8tXjScfs6SfIGBVAqBjUPUpXxLI8X5aEotWs/mSdR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZ7+7SvxvyzE4HZtBGmqWpjA8ekhgH1ll4C67jhN5tIHZPJasKoMjtw/FwvivC9eOMpjWZ9+BEOVvGv5A29uNcc106zFfx+CvWSUmdeXBKvC3B59w1tKKVykAxFBF4JqTZhErl/FCpj7Q1MNJ464knOkfH4mFmNC4G9d73MAshw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PcFcxTCw; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PcFcxTCw"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-39b2cead848so588535ab.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Aug 2024 13:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723148422; x=1723753222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QfQLxAkKJO0OxN3PoS9gfcknEgVgOQSzt4mX6LsWfm0=;
        b=PcFcxTCwrhV66d4QWXs78cB/g8PLFxqohmvRsKq2yvWs5ANyMMfScdXdr6Gm5uKzQl
         qwN8ADwovIu3wuNKzlZQhTMt1ypJ8O3YCKHbRVe0m6o4VSYVBiGkmfq4o0DYGMva5/er
         baOinfv0LhQvvQpMdNlWfhzqzxoYtjJJyJXa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723148422; x=1723753222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfQLxAkKJO0OxN3PoS9gfcknEgVgOQSzt4mX6LsWfm0=;
        b=evhrfdRps9WPH5hUGQR5/No+e7f5DLnSS54Ha2xMBT/7H/g0rpsWqImLJuK5XWgxl0
         ErYbPg21/sWhAMWAhCwDIlBbE0JWnxDWoOZk5IEAT+cpVUNgFmkQVNQ7zDlSWcUkupRH
         7EXyNbCx1koLuJQWplJn5G5y2ZfSx+WMMReoldPlxwiHGPUoGn8SC61zTem77R7MEVNu
         VSFtiP2ch8AkbNhDh/ZrJGTNga5YhsbMFUlepK7ignlYh6mB9ltdWkNyQkzJiK9ExVe0
         Yoc3+i5wD6mZALzyLY+Oie8WOHbVybuSbDm1QdIAEKTK0sIrz5Rh5hH7RXB9X0q1DHn0
         Axmg==
X-Forwarded-Encrypted: i=1; AJvYcCUmAJGYBtUP10XsQc3ABf9x9sHmGybHohr9v0KMr2LKJg4UDcC1mKV4m7rb9roo3ON4iWyc54N0hWyVn0qmfbbvXAJ+XXHmjJAQBZg=
X-Gm-Message-State: AOJu0Yx7dVgLtQZpPj7OZCqwNeC27qI3W8eTvdnSBMXh+9XtTJtIvfsa
	N+13iA4i1eArjAsPs5Uv5HztS8AmoN0iP2gwHCkhAdnAJ6Q7J0CmvGOKKRxt2uc=
X-Google-Smtp-Source: AGHT+IFz2Q8BNZhb/hkrGYq+MEEYJykLer5kY5z3ptVsISOpOwy8Tnb8XprZ34ZhF4rcXiEOjQWgxA==
X-Received: by 2002:a05:6e02:1aa2:b0:39a:eac8:9be8 with SMTP id e9e14a558f8ab-39b5ec71b5amr23752905ab.1.1723148422046;
        Thu, 08 Aug 2024 13:20:22 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39b20ae34d0sm56676835ab.56.2024.08.08.13.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 13:20:21 -0700 (PDT)
Message-ID: <83d4e1a3-73fc-4634-b133-82b9e883b98b@linuxfoundation.org>
Date: Thu, 8 Aug 2024 14:20:21 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/alsa/Makefile: fix relative rpath usage
To: Eugene Syromiatnikov <esyr@redhat.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Artem Savkov <asavkov@redhat.com>, linux-sound@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240808145639.GA20510@asgard.redhat.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240808145639.GA20510@asgard.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/8/24 08:57, Eugene Syromiatnikov wrote:
> The relative RPATH ("./") supplied to linker options in CFLAGS is resolved
> relative to current working directory and not the executable directory,
> which will lead in incorrect resolution when the test executables are run
> from elsewhere.  Changing it to $ORIGIN makes it resolve relative
> to the directory in which the executables reside, which is supposedly
> the desired behaviour.
> 
> Discovered by the check-rpaths script[1][2] that checks for insecure
> RPATH/RUNPATH[3], such as relative directories, during an attempt
> to package BPF selftests for later use in CI:
> 
>      ERROR   0004: file '/usr/libexec/kselftests/bpf/urandom_read' contains an insecure runpath '.' in [.]
> 
> [1] https://github.com/rpm-software-management/rpm/blob/master/scripts/check-rpaths
> [2] https://github.com/rpm-software-management/rpm/blob/master/scripts/check-rpaths-worker
> [3] https://cwe.mitre.org/data/definitions/426.html
> 
> Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
> ---
>   tools/testing/selftests/alsa/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
> index c1ce39874e2b..0f204da9ea8e 100644
> --- a/tools/testing/selftests/alsa/Makefile
> +++ b/tools/testing/selftests/alsa/Makefile
> @@ -6,7 +6,7 @@ LDLIBS += $(shell pkg-config --libs alsa)
>   ifeq ($(LDLIBS),)
>   LDLIBS += -lasound
>   endif
> -CFLAGS += -L$(OUTPUT) -Wl,-rpath=./
> +CFLAGS += -L$(OUTPUT) -Wl,-rpath=\$$ORIGIN/
>   
>   LDLIBS+=-lpthread
>   

Wouldn't make sense to fix fix this in selftests main Makefile
instead of changing the all the test makefiles

Same comment on all other files. It would be easier to send
these as series - please mentioned the tests run as well
after this change.

thanks,
-- Shuah


