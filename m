Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07826A08E
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115736; cv=none; b=Ses368xZUa8WAd9xwX/nPWiY7fTUEur5v0NlOyfLSWjyogKJVa8jl+9ZxVCtxoNzcucqKAD4Xkx9nWs5jpGBvTxWs7Pl7Afew4rnWBMGa1SbcdNpy83PDnzp8ZtX6oyCrGt/wwm0w6SndDs0MjUXiw0VP2YnwJdttegrLylHWEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115736; c=relaxed/simple;
	bh=fo/D7Vy/bHCJLwja2xD/bb/2rXotbdfX/H7Zo3+wDT8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gxxbxFqhPA2pFwX5ivjYLu2307izUgsdGUcL0/NgzzE2daetJtO1jnPjG6seS9HBEhtsrbtMrmZlHSbY+jJQP0wv702OWc13nJbWe33L30pEiPdUukqbTE5qdiZJyAhKEP4/RfE1PT5ofCgMMyNcbQ07wDa//5tFNpHDcvA7g5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JX7dY48t; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JX7dY48t"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-873a2ba6f7cso1355020241.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Apr 2025 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744115733; x=1744720533; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/U112c3eNoEpdOFrvh7CcjezylBSmoKAUzWeh1M4C48=;
        b=JX7dY48tnLpMwTtIlkRe0oS63IKpK/V2zF9onH/8kroqnJq5CBPtaS74ph5bEzzCgg
         WfZX2lkRNrnCkJXpquNqhziFUq4Cyz4FGb4xDfzYU4NGrEcxzIApADO2POgAYysfTYXK
         iteYRbZBWzTK9owuukt0puJEMRTniJ5g1cgP5A/R1+Sb2VgQJOanHB7WSeTPfiqSp9l6
         0LZFUPdvsGwmGXQ9iBkjINorRtpKnw8cOQXdV2E/aG1gaV+ba5Hv4l4Q4NS5DdF0aXs2
         KVQQX5nt7DcTUrnNkZ93k/vIyn/Wz8XpALeqXMNCK/b/jys7Vc1oi7oLoSGfbgERq8Wz
         FRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115733; x=1744720533;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/U112c3eNoEpdOFrvh7CcjezylBSmoKAUzWeh1M4C48=;
        b=ZGw2edhIcEokRBtMBXgr/sQAt8bgkQCz3ZrFFlwZVNIdLIF11Gnz9a68YWu4JfOq32
         PlcW7zX5cjg2m+gd0FKf7lt4LwLNZvM8pnZDjyCnphj1aNkhXaVu6b02qh18gWKjQez3
         wy4Dyl7gzBROjDa6hwpsa+252LtwxYbqhzUA/AjVo+yCVn7LiPnqvX9GnUOJ+oy5Bk8r
         PkO5f1jVHFRiJHhm+RJaqwV8FqEhnpdAJ1QLA67M4T74sl7JKHS7Qu2LOSuIS/gz+CGi
         MNhIJIFuJq/Va7P/dfhKjkPNJtfaxVs65Uxfi11qNZ97hI31U5xBEinYt4sKwYn/snPJ
         Ir/g==
X-Forwarded-Encrypted: i=1; AJvYcCVO6uMGmp4lrWNYYwcUoCcnVrsyDJuA1Forvx+7fUlAacIbbcZcfaw5A/idX8BU2y6aiAjg3mWiq7vryg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHvSO2atHeGvNbQMaE2BOkBsiwJ967ml4mWmvLQRC+yf+fGFpn
	8l6xG2t8NzRcrasQsZaUQkXzODmVY4ICF9komvNPCT+4666+SB5PTkrNOvvbTYVErItqBok6WAH
	IuJ8n175YWsax0KDJ71Ywm2yr7Jj6ap/Gcy2vT+M+rbTK/gfs6HY=
X-Gm-Gg: ASbGncvdQYrlooB7kmWUBIQNiWKe14cdVqtifEJxbD7bF//G57RrR7oZ3DtQArmrL2y
	yL9zmlrwyJcO/IriujnCnDf5A5nuDD5G/Sa1oNZCvJN9SEgX6Ylf2YZXSiZogCcb/3lz1lzZmdt
	ZeVJaZZeCM9wGLUrOV2A/sdwdU0K/xLXN2c8/ultRmRHuxp4Ky5hkVx+I0/ql4Bl10//Q=
X-Google-Smtp-Source: AGHT+IFfrUZA9P0FlfVvDGw+QCkUVYYIjMI5wcSJPSzAp7n+zPY08mgfTxQqvgd8poJltS31C52pfXlDC6xYxKM2j78=
X-Received: by 2002:a05:6102:504b:b0:4c1:9738:820d with SMTP id
 ada2fe7eead31-4c8568c0b92mr10407478137.6.1744115733375; Tue, 08 Apr 2025
 05:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 8 Apr 2025 18:05:21 +0530
X-Gm-Features: ATxdqUEWaftFPwcDydUZjRrXkKZePynV0fvjVXPcjzvBxMxN2KkMbyUQeWe8Fe4
Message-ID: <CA+G9fYsNUbN0PsDQBqVAoUSjSXa5igOjntBFh_TF6m8A4FNDsw@mail.gmail.com>
Subject: sound_kunit.c: error: address of array 'card->id' will always
 evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-sound@vger.kernel.org, 
	kunit-dev@googlegroups.com, clang-built-linux <llvm@lists.linux.dev>
Cc: Pei Xiao <xiaopei01@kylinos.cn>, Takashi Iwai <tiwai@suse.de>, 
	Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Regressions on x86_64 build allyesconfig with clang-20 failed on the
Linux next-20250408 tag.

First seen on the next-20250408.
Bad: next-20250408
Good: next-20250407

* x86, build
 - build/clang-20-allyesconfig

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Boot regression: x86_64 allyesconfig address of array 'card->id' will
always evaluate to 'true'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
sound/core/sound_kunit.c:271:31: error: address of array 'card->id'
will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
  271 |         kunit_info(test, "%s", card->id ? card->id : "(null)");
      |                                ~~~~~~^~ ~


## Source
* Kernel version: 6.15.0-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 7702d0130dc002bab2c3571ddb6ff68f82d99aea
* Git describe: next-20250408
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/details/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vQpM7f8SQvntzGG0Tdgxj2amGb/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vQpM7f8SQvntzGG0Tdgxj2amGb/config
* compiler: clang Debian clang version 20.1.2
(++20250330123306+5ba194972878-1~exp1~20250330003423.94)

## Steps to reproduce
 - tuxmake --runtime podman --target-arch x86_64 --toolchain clang-20
--kconfig allyesconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
