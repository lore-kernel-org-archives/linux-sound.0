Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382653E3DBD
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466627; cv=pass; b=FqxoIpor5AWsXVvTY9HSDC0YEgcpYRc9DNTTZ8t2RFiM8XSYUzt5w89YXvPPbNlwE+ljDDOaHN6uCRiYatYzf94Dn+x61C5o2FPJjmBAk/DSleDbJSJd00mMTXQDZmQw/9BtdITYsWQ6by+Xfuln3Jxr6FXgYs8n+xPYx4OYqHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466627; c=relaxed/simple;
	bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgC/qIUXbfUfMmMH6EV676hUOlyqoFToelm1tgqm1rW/kbDceOqX6ooCr0yYIkQ9te4chwutSuBxY1mQUMUndic+o+mq0fHQ69nKM2N6+HBF2BLRMPyRdZL5/VRE37PgGmSRsdUZZMQUsj4gA3caQhu1ydlUfiJCdWZhM6cuEUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdPfA6aW; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdPfA6aW"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37d46e0d246so335909a91.2
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 02:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782466624; cv=none;
        d=google.com; s=arc-20260327;
        b=std2hEVd7tU5+h4/RPmq0NKSUQoKDmfvgn3ZyxZni5gQHhK8mfWmvV4uhzbV3e5buk
         zicCoYzeSg/SYPLHdIdElQq94d0wg7ilEZvnBcWGrhFBMP4gGQo7EEXLjg9Vt6HJ3idu
         Djvyo//64S4UJdIpnRrevRQYWHdNiMfX+fWz4hofTgzm8N2Lp+CGA56WORjnUwPUN+tE
         6OmvZbGXlP7xcbnmcggRweo/1vu3W7RKorMXdQZNbA6FyVq3jXDS4rdxyFcWchxNUp3c
         kwQI0oJXLssVGFQZCcJPF6OmIwj5CD6lbTxEucH6pYsSphVor/5jm62tr+JBjIA3G5dj
         EDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
        fh=7fs+TmwkHAOGlbGUJtgGcqC+9qNOTkp0vYJw1gScUmA=;
        b=hdQp7z4P0nZmc2ljHjdBgbXmty/IuVrrG1bKX+APZ7xMcRYJEbJYeH4dH8ul8WPAMC
         EYEz1lkQfCOCZMAHWRWkpfYU62MYXHRZ9oyGvcvFj95sERijrt6iN3wWX58Xsx1RkNnc
         KyQtxgd/hTXoMi3px39AXSyd0EwDs8ZnqTPkIC0aC6kKo6Fhj1d9kfamRydD+sODPjNw
         ZYPN8LICSXvtmgZsJWx1cTY6FUNIcaOgSyPZF1jDMGmO+Unz9gB/dfHTjfpWIOpHp0H9
         G1cqhpG/E909L+vuQj1oMNStJYBHI7ZvN+/2/4qCSPjALPvZyx3/y8OCq1krOao0BVd2
         WY0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782466624; x=1783071424; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
        b=QdPfA6aWqkmhRgev5c39hJbYLlADNoFfYySqIdAaLnclKWlaWmBrljpE6WziwjyNrp
         6bSBFPfIJltWkW9+dqaqe+nO6N76t9Xu6WOKw1cBN7O6fF1VhYj0PGGt0Fc54mv5vuf6
         zKrotYzoYdZLSA/T7Mvuy5TxsC4yNbZ/dVBMEbxD6yT6uaSJDsCc6Tp/X2CXwvPjwwZQ
         g1W1rWglOxEziChjCu/DJSCj6anhEJ5p5iVaJ/JbtkMd57REK5weWzFVByTg3SFiGmfw
         ikCm8Y4gRBTenyZKZ0BTxxXXqSKsDFQScyAVYqEoVtnPXwOJlxckhKcH0qSGWQh/IXgZ
         Hm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466624; x=1783071424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
        b=SihIJv8mLqrDS62B/qXAtcN1IBaaSfG9BbAjVVjHnassVBZ6QdYsNoJMeq/kkrn+33
         GsP9KiDm/bEzzc1ODgTOSUXg4yog+bK4m3GqHWDsfEnKubwPz9EXyI94pu8QFOW80BDo
         4Lv0bo8wPwmLZzh4147Gh5Tfdxytr5QhBDf5PASO+2I5kFQ9oTEfhNqRg6PTWimJDf+O
         ZMEdXvU+qw/+dZZTpTohERN99hDOiAWi3UjGU9jDdilFLldow8qN7INfL9vJtBsngtj4
         CubpwvhTvB+7YnKHrBdP651qeHKVGJeVE/hmwZZ06luUoE4zR1lHTHhArNFKMm4zB2Yd
         8RJw==
X-Forwarded-Encrypted: i=1; AHgh+RolSnPhBU3aFB3PFGFv5zQfMY/JXqnQKTG8e3N60gA4EZUbExBgZICj8A/QjAVq8ySWicyhjJVadKehrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsPiRUnjeyd0Vm7G3IftM8Jh6MF4lDa34wD77Iub5kiUjf+lI5
	LoR2WK5bZ2NUzV5BUIH4QUoJejMmXGSjezXh+G0aCl9LctbVieWIG5oXNcH4ZabJ0n/uqIrmbcf
	MKoudrDz709GjSFHUClzSzARCDnGv8YU=
X-Gm-Gg: AfdE7ck1N23HxEcOghiv+9SSVrS3H23dvshkDy64hToKfhlWq/kfSwlkZ/ak9WKEdX/
	JR6aXEryuzX22vybYu1bDwS3nWB2wQ70IWqeVZASvUzbhdCnYyu82n8iLvdxDB716pkhy1FagZ4
	RvPYk1TMD284J6QpPqKwzL6r7WV1Z8KkhPMgZbuoIuiXjtcMem3MGinYKM6kOxxmDOXIqxX/XXE
	vhWQzPByySR4jmQkPsLavDXCyT9hoF62o6Vz64PkPf9kGKtj7YAXOioHbWwtmBf03nb0ReAyP5C
	Td/2wUji6C6d1qEwvXKAr5o+Lo8=
X-Received: by 2002:a17:90b:3d81:b0:35f:b647:d98a with SMTP id
 98e67ed59e1d1-37dfa1d3fdemr5625529a91.5.1782466624154; Fri, 26 Jun 2026
 02:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-13-phucduc.bui@gmail.com>
 <9a31d81e-5656-4525-b5c0-89b02f179cc8@opensource.cirrus.com>
In-Reply-To: <9a31d81e-5656-4525-b5c0-89b02f179cc8@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 26 Jun 2026 16:36:52 +0700
X-Gm-Features: AVVi8CcOicQMwfYGu0k3_RwjtDGGSW54p-K768oBHJj-nyjVSxC7BUEKxDmUHf0
Message-ID: <CAABR9nHxu4_BkSKC+9qAobgSw4x7XkFz9nVHLKWVi-i+6_Xg2A@mail.gmail.com>
Subject: Re: [PATCH 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> It doesn't look cleaner.
> But anyway,
> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>

Thanks for the review.

Guards are particularly nice when they can eliminate goto labels and
make the code easier to follow.
In this file, as you pointed out, they don't make much difference.
Even so, I wanted to keep the style consistent across the driver,
so I tried to convert as many suitable cases as possible.

Best regards,
Phuc
