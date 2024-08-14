Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A244C1AE874
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723634062; cv=none; b=KutdqXEhuTN8g49iJzPEY+L2HUQ5gSnJ9ig4hvEPclqjLotEx+G6qAD4iX4P+J5Fi/8XcxRdECIRUWK2vAyj04G/ffOdlr9iHNttvVvRrw8cP/iNkGgRM91N+e7ANxlxVRXZH9GHsf424dTW6FvDokEq1UE4efKOb+aBeRBl+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723634062; c=relaxed/simple;
	bh=TmoMJ6fBO+2ujDKfbDp+SvGtxKOPCAMH9eaWcdmMp90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyGvE4q4hOMtVXz0RBn6KLXQrj4qDbx9xhxeZiEj69EqjDl4c/nnzccssKLpsMsQVdLjEYKs6plO4EK+XhMd0SOfHYJDSs0igfaZkHYl+TxP9aPsTm+/WM6ArtrFTkc+08+Ots98keW1FFWS7TFmYUb4WkMWS/KDLzIXeP8nmZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bjei94dI; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bjei94dI"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3db111a08c3so510369b6e.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 04:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723634059; x=1724238859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKXOpaQjYZ23IPY7QFGKRm5V8t0HdIQpPj2kQ936F8Q=;
        b=bjei94dIzvSaYyLy2cef+/JkedIUo7tMCAW1GPcsu+xIgmsr+QAW7rrEwZuXw1X/RB
         8QhzhQ5CGMvlWex0QIkaKbKwnmxBYAAYvn4Za2IjZvoHK04HwnkgRLw0UFzEClTxv7C7
         yw/ZOUvZT+Q32qYvFcddH3xrtYxWrsP6f1gVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723634059; x=1724238859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKXOpaQjYZ23IPY7QFGKRm5V8t0HdIQpPj2kQ936F8Q=;
        b=JE36zIVG2lAbviOAVh0zDo1LzQNvWYIN5s8m5J4sJOpmHDINFwFuorD7HJXH4mSzQl
         KJQjkQQ4HFqq5mYMPtcgSkptsgWNgA3BB5d7WGyWXCE3V++5FAFylCBR0mNEazp3dsVn
         inwAgBYWgvavimkUcPF+V41xPlA2JpovNrG1UgP/FLKV2qVaLKuofEBr/lXHmM2t+ac8
         KrLbZlo5pXuvOO/ZeBHn6VxTyZB8iKqb1w6c22AmarLUv11n1o3GcZp6EceHVTGrKpkj
         GeN4fB6EqI1eKICaDKRSKwQNJ0VpX5N8pmtwkwn76kuR0SuhWEg5gjXQeyN9btE6rSu7
         EzxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDWotp8gocGBVyDc17O0uImh5RYozG439zOuo4wtrr7ULAgnf6qImb7p/7vtz+KBnwap+HbiJvRwXXTImKD5cqITmq+BApzdV1xW0=
X-Gm-Message-State: AOJu0YwTQhCHjVUxly0aVPo+463tGZADxSlqClzqmNV3ogw5MUClbJ4v
	iLqaDaJg0XymECJyU9GU5UZ8mbgZ/oEq1+ObJUUdbkMnbQ3mowLBFncbsbhwTQU=
X-Google-Smtp-Source: AGHT+IGU44jZ8rYe+yb/lWQqYJ9ZuIfKYis6ezIFOdZQVRqvwL8o7Dssf+jOnx1O7fDJ7mXMGVBZtw==
X-Received: by 2002:a05:6870:2195:b0:260:f1c4:2fdc with SMTP id 586e51a60fabf-26fe5cfc907mr1531281fac.9.1723634059588;
        Wed, 14 Aug 2024 04:14:19 -0700 (PDT)
Received: from [192.168.104.75] ([223.118.51.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a8c454sm7125527b3a.180.2024.08.14.04.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 04:14:19 -0700 (PDT)
Message-ID: <c946c5c4-366a-4772-81d9-dc5984777cfd@linuxfoundation.org>
Date: Wed, 14 Aug 2024 05:14:08 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: fix relative rpath usage
To: Eugene Syromiatnikov <esyr@redhat.com>
Cc: linux-kselftest@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, Artem Savkov <asavkov@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240812165650.GA5102@asgard.redhat.com>
 <3667e585-ecaa-4664-9e6e-75dc9de928e8@linuxfoundation.org>
 <20240813163348.GA30739@asgard.redhat.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240813163348.GA30739@asgard.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/24 10:33, Eugene Syromiatnikov wrote:
> On Mon, Aug 12, 2024 at 05:03:45PM -0600, Shuah Khan wrote:
>> On 8/12/24 10:56, Eugene Syromiatnikov wrote:
>>> The relative RPATH ("./") supplied to linker options in CFLAGS is resolved
>>> relative to current working directory and not the executable directory,
>>> which will lead in incorrect resolution when the test executables are run
>> >from elsewhere.  Changing it to $ORIGIN makes it resolve relative
>>> to the directory in which the executables reside, which is supposedly
>>> the desired behaviour.  This patch also moves these CFLAGS to lib.mk,
>>> so the RPATH is provided for all selftest binaries, which is arguably
>>> a useful default.
>>
>> Can you elaborate on the erros you would see if this isn't fixed? I understand
>> that check-rpaths tool - howebver I would like to know how it manifests and
> 
> One would be unable to execute the test binaries that require additional
> locally built dynamic libraries outside the directories in which they reside:
> 
>      [build@builder selftests]$ alsa/mixer-test
>      alsa/mixer-test: error while loading shared libraries: libatest.so: cannot open shared object file: No such file or directory
> 
>> how would you reproduce this problem while running selftests?
> 
> This usually doesn't come up in a regular selftests usage so far, as they
> are usually run via make, and make descends into specific test directories
> to execute make the respective make targets there, triggering the execution
> of the specific test bineries.
> 

Right. selftests are run usually via make and when they are installed run through
a script which descends into specific test directories where the tests are installed.

Unless we see the problem using kselftest use-case, there is no reason the make changes.
Sorry I am not going be taking these patches.

thanks,
-- Shuah

