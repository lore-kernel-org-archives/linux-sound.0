Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AF81B5EB3
	for <linux-sound@vger.kernel.org>; Thu, 29 Aug 2024 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724951122; cv=none; b=Yy9Uo/3kgYEB3PWBwgYRMkSC7P5h9xVj+pT+YOWzxDv8No49yY/RIWlmG0mIbICbMObL5XYPEtNGo0azazy1RxVdUTxOFUy/dUuCQKYdfKP0oHbUtYq3jFGOXNlRYFqxhihRux8WJpY6PVUDJnh6sxsjyzNGTMQaKMzpwYQPTYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724951122; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3NiquS4MsSyhCCLb41w6gCrs9DGnxd/OI4iaYFVyjpDDVBMQr0eaYVqhMcQ7HBSYU8+CMmnTGCvZ/g7JwfWsjoEMRXiSPG251L+KAnrqOeY6jds/degQjYYFnGBAgzbMXlq7GH2yxStOiL1aB6TPqR4FrK/kav2z3cx0CXN9a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ROhFhDPO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ROhFhDPO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42817d3ecfeso105e9.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Aug 2024 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724951119; x=1725555919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=ROhFhDPO9Ll9pWySk8+1RNzrFAIkqvOHeAt76Sekt/2Nq2RgyGnHOrg06nVAwJTbbx
         zAi0uJwwJP0jqEYMfTHLkWaLJ2gekVim0k8G/dT0p2KPEwnnDBxr8vGAEIAbWGgwydbJ
         27gRXfuhbdNIvrexgxiNmeLdRC7iD8eL/W8DICUJu+ZkoPpVwFJIzZtULYynfRQ7WJSf
         hf3JckSyM3mS9++wZHTI426vRojfg3E4bT5gEo9V8aflq0OYneGz+LtgkdyczysS1TMQ
         xYqLj5Joab5nUxH9a9uJl41/gt6GcyBRtoMAcugUPwyUekYoCs3c/38EOqb5F/7yf3PF
         4aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724951119; x=1725555919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=cjf2CqAuj0Kg9tqaFD60zKJ3/PY2vALrklF4msPUOWFuHN0+ONKTTsDFrls9kxuFT4
         yWssWYscy6u70J1Jgh+1RrFNa3Hm1iOvwYviL5IwJAzMrOaqOT6gTIe9Tw+B2u9VSyT/
         SXaZpOn8KsCC6Lu/NFKYb11/MMBImZ09Ukcwa67lSNSoB/Z8s0VG04GZ2626s/FsRHG+
         Q/4FQ3pP/9W9k5c0swYGbJvtcwGBkhEDwlD0ErCp9zzMBiUnrZhBMWHlCA8R9xeJyI4P
         hhTwj2xhqbRpQ/NhOrHNJyWLmyxsXsiMxvZGajxbbQbD2kjFTZL1e32zp/yAD0Q/yWfM
         lEXA==
X-Forwarded-Encrypted: i=1; AJvYcCW5cKYfo4U9WLdaIDAF2ccJtop0zUj7UwuidFfbHlGIUQmbA2hNhpCCZBQaDc7IfLJ0CFgiTznUWSUbFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw182iIl87K48GW855kw7xd8/sWmlf0kPlc9dn394G4BHAAHmPj
	H4eCAGjaoIvXfPMLgeDKMIG/KLSgcUjMVmfq/oHtA9odyOII/hl6LlItJahBBqp56uNvNvUL8aD
	ETFMed80uUZoh54TTWzB5onwq0m+SNSCU2pvrvcfusJO8Pqdm
X-Gm-Gg: AV9I1ZT6nERwm6mulr49n5t5uR2U8aJ1TdvyBQjDF0SyO50EI6VHRodEPxq2ClBPYpz
	BB6+v0UVgMrJGAj1rVCVlqfpWntKavQpCx74dIDH5Kh9eV/TbywHkCpoF3vk=
X-Google-Smtp-Source: AGHT+IF8ncbv3hPX6txBwjD+mljfVJFZjCz8WD9pS5r0ChWeEb3HcbLEeUEQAMuL4Kr+bb+8RiZA/+ov4ZUA9UxFSLs=
X-Received: by 2002:a05:600c:6d12:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42bba2d4b89mr12755e9.2.1724951118768; Thu, 29 Aug 2024 10:05:18
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
In-Reply-To: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Thu, 29 Aug 2024 13:04:40 -0400
Message-ID: <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"


