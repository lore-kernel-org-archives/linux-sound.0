Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CBB1D45EA
	for <linux-sound@vger.kernel.org>; Fri,  6 Sep 2024 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725645020; cv=none; b=VrhuZsv+TZ/aXpppCYWy232MxiRNymE7DehG9VXbIxKmgc41Zj39nQKPUIB4setCOBX694sbyannP0m0+s9M+Z1vnlwDJAGzwqaULs83wegKbWqxepcXLUorHuqAKkou4G68sD7OGmHklODzaUdT2dQGQT19zfR5IuzPxYuPAH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725645020; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pR4WN90zUOyWynSU46C8SnKRjxwMLPUbDbuhcspBHxcJBFN7YXPEda0A2yYH9iv28J0MJcMcvNDIpUOFEEYWclOxmqKMgirlfkvcQ5Y2w40v1TnhPSFKwni2Mx8KeviVw0p0hoxBR9ejS1uDTXDu0fTC7QjqEUtIAYSVNkrvTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S9ik7q7/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S9ik7q7/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42ca2d075a3so125e9.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Sep 2024 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725645017; x=1726249817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=S9ik7q7/k29xUOpJQRD3mc+GL+x/r+ZRglHfWZzWlrqbw9wvYyEa3qbzbhI4x2tddn
         cKifEPDSUS4v05RMEUmTunZTWmf3/zpnBjEY4AR+L0lkCG3gh0ZL7ldCLQKfA1XEr1C7
         d07flH4+TqPVFOINEth9POE+r+B75eoX9b3YUvfyU7NXzmy2NqM5yHCRr772Ph3t+Zpn
         fL0WSKhWTEt9Vyrfec3UHtt84n7UcgaqCr6kORf30glzaM0jiHdNc5WO+R+Dgz3BuTc5
         v6e7X8cE0tpM0zfGoVgVjmHMAJxs/c48JMlCNrgSC9FTdLUOejAL3ocPYWiDITAHerbC
         I7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725645017; x=1726249817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=dtAA4VzjAFW5f25vuKSn6GBvUCeVIKnHMav3r6TAut8AkDHDP8n+GJHa+sIoUZwI6L
         b10bOHjAHUZGuzxfKBe/uHbT8Dvc6q/IxWYt3RFRSDQKkT+HdNd0Rz7an3e4OpNUbfMv
         KEO+IAFxkJ+HTV4ESlszL7r3ipP/j1nLn7VoPFiBdkUH7NuVYre+pfMbRrQCMGJzXs9x
         35N7cmPsJiPu5QodPIC1GPj5rVjYU7fcQnT5V4sNJ8HYjFz6mLz6X3XXrk2loViW3MNb
         MrIwvAKkDIlEijfsh7964kP5bttnEN/Le8+7w8j+1BwP5OC+dl3Aa3lO9iiqTwbjYTBP
         N3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVwTQron0gFK8gJvpcu3MMPWBnWAIpCGgjxPyYANNcO//OgbYBiZe6Wy0H/o6D8TiBgOershkVJMTaYqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6HvM0SYc7o3ITPeWcxFfJl/0SJQr/G8uDFCa2CCjRqDXefjb
	/xqVM4cj/1DZty4J5oM9vVt72lzwlwuucfmCL2r2W3lFqMXra52JbwLKvUJfpb8zrWxgB4zAErK
	YOQrFK8FW2vR/mzTtiOgBR6QvCipX5kjufYs=
X-Gm-Gg: ASbGnctCOzF3UOp0rQlpUjzZfaKuog01HZExDKSU3T9g6I2KWUjLuyitG6zZl1NjSla
	OG4cAM0rclc7rKdjrhRLLn/ceUmh7y/jALU7m6gCjE/r1qR4qslUkq/9VtA==
X-Google-Smtp-Source: AGHT+IHOlcv7vqlkgAnGOoFg/Cdu9KrQD+OEz5m6AJTBmUsgUHU751o/ZDkQMZfiOBrlPwGBZScRBDsy3iuUbw5u8dk=
X-Received: by 2002:a05:600c:254:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42cacd3ab7cmr25915e9.2.1725645016574; Fri, 06 Sep 2024 10:50:16
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
 <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
In-Reply-To: <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Fri, 6 Sep 2024 13:49:39 -0400
Message-ID: <CAFs7P=jfzE6V4EMdVZ73ShdWLavv41kU_NdK-=CO+Cv8dfGBGw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"


