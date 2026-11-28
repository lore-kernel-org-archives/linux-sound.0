Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853651;
	b=VerZQW4alH5pIqekzxYc0eAF7mkJzblSH0vqQKJOu30ZaSzn8fqmK+0RiTgUNZwx7MKz
	 JF0OLLcx2zzgPuTWDB6YsTUNrmAQd5LLJnC4lj3hzwgY7T7bcCtPqojV4FUnir0NHXVtW
	 JucO6h86ks5qXyuV6f/mtssOigP2sFNM+TKtOErwEkBhMQMhauJzSlwGS49VuMxNp6Xw5
	 zYDIjEvKYk+eKxLLYIwlQmuf63+CRXwF5FGgYvaZkHSLMpUlWIqyVnoYcGDm+7tNhyLYl
	 k2xmZZhGVnoI0tPhIDGDVLfXNHv2q7FSvdnS3TnBZg7/yBireYabZnEozu0hEMKd7kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=3RJn9QmvUJJ5Y6G8qtBEm2ZPDJaudh1wdwqc0+qRKJgMLgA7lcaakoOI9/kPwBZXDeWY
	 fynj+SWZiuefrJTAaxwgBspMaGBhy6zBFtID1gfEeqRJscUfdCx9zJvgo+gfu0c9MWMcl
	 Dm0G6P8LdRLgxPSUcxbfqnkH4Do5v/IMlN7fCLHbKIa71w1a7L3eZ6V4N6YLWj13UCK3X
	 57eU/GZQeuTfoCO9oEP+FqABljmZYadFFkW1qH+dwnXpSl175Xj1mFy2zd6o2Qe8HYSSu
	 3dTbCI+mjoRT+maG3jZi9WeEteAAJpcni6yBdqYekKr/nDvk4fRbcJZKMieV/XYq7QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LkFHR+h;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716CD606A321
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 08:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716CD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LkFHR+h
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386ab9ab619so12471659eec.1
        for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 00:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853650; x=1796458450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=0LkFHR+hbGSu2gI3IDGcRw0jA4AabyAmC/x4bSWTV50NzBwS1B9nqK30kMEcSHMN1Q
         mYfGHnRyrmAQ2HRXZZyDKhLgBRpCqjUBnCk2IMaQICVlg23sFOyU2HZp46TdZyzYejAd
         kus18h3lhSKl3mmKUwJom9w1fVgXVzif983/B6GieSZ8LqLmm1V/w/zs+oTVaFxVmELl
         4c15LYZMEj2ld+8owI0SF9tjWlFOw0eTc3IFgjY7P2MaCm/yf85W/sD477u9b5U0wveK
         4CbRrbbuPrEUUfQ13R6kVsIbDRWylbY/dxvm8p9yrVY5/v638GkEntjyUnHRuBCFMzKJ
         Aq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853650; x=1796458450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=yID0djYX5Rt8QfKj0FP9jmcNACd5put192ZbVbPDM8DY8tT27PnpkVC50t75N3jiET
         +zEukRUuVjpZgWvzrJMn8nS1Ks3Waz9lnizuvAZxC9XAfXHGeyNFvZ6JagkEWXm64BY/
         mq1joKrMMHc6QbLiH+4li310hFaGBlnzVEcl/A/Lgx4oLV45JFccN/clWkZ7QgCZ1cGb
         EHoi3pMb1rdZtZGJfC8wykPMnZXPYxNojavv4xTq+5fSHDl7U55sCLo3dgv6+McsxbjL
         smu6TsSsdleSdYB4syLlu2MSVW6hyhJh5xD6GTRppoDCTLSLKFqPZmYhSdVClBbMsNln
         DRuw==
X-Forwarded-Encrypted: i=1; AL+hErHliv1nWUJjTN6Ny2NsCvXkHtok5kkAPDK1fWPMCoqy4NHavj18AVnmLdHf8Vg1MieX3yQ22wRkt3eEsQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/s8INO/F3STJHUjF0t1BKnlBIcWDJjnOFhLFeM6D7xMd2E4nrw
	RhGI0MmUZOUpK4wDiMKcq5cuCSU9L1MNz1JxKkrkrydBMiVkFquCwehf
X-Gm-Gg: AZFdTZe4/wU2xg1x/qKccnZZWpSKsEDyXbsiLh14mWcJfaOBH1ylOtMwwBr7feUE358
	tyqXR94PfUu/Yj7qrFXx1I5+XBdWeBR8MffCRMiwEgjHvm3IlpYcz/V9Z3wgmE0dlKd2EHqaJ0A
	V2va+zadwvwPeXFIJsKTI81ugw5/PJlIMCL8Qof6PAw/ZJiD6A402GqupBehlaa2vQxb1CNwTrN
	I1Smrrozjtblb6A0Z/BWfz4lC0kU/v1DSV8cmlJpf9oTDZa5yu5eELbD15mOtno6AsDS57uRGlc
	b/9A6d4VuK6EmMAqghbiYGiN0bc0huuwzcLxjMVZEwNZdX3fjZWHhEFO0jYtvvSk2KcFghjd1/u
	wYDMkdFmgikO4Gu2vBDv4TUxeveMOi01PddvecqO6U8yJDUsS+3llbbhcWs0+vTv7F2b2I8jk8B
	85hmIpV/6W0Ng0BSzJXvxggjvCkhGxAqXnlPlNVJEFFQ7ZGOuMTX5uJSW3sOkkTeg2ojOrSWZ5n
	kGbBv4tEVk4hon8E6hrkeQzP9QWXGOqfs+wRj+NC4xBcB5tBdwWRbwu6LTEEHI4tZx+tKpuRwML
	MLTnSj7wpHyKYAji8mXVLHQSOzE0iGcdoHjBiJgeMrWBdRrcoKgn
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr26765984eec.36.1795853650596;
        Sat, 28 Nov 2026 00:14:10 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm72360114eec.20.2026.11.28.00.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:14:10 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: vmaster: Restore follower values on put failure
Date: Sat, 28 Nov 2026 08:13:46 +0000
Message-ID: <20261128081346.3007-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87ik1imbb8.wl-tiwai@suse.de>
References: <87ik1imbb8.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
