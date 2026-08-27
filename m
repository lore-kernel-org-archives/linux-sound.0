Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C2456DF3
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836365; cv=none; b=nrHA6IYZjMl/yAtIz5oJJ1xssVQwTh2I+tMmXT7/4SZ5D2RgUcuBLbw/QDcMojlu+N7LRu0URpjOmAF7Fxsd9XEjusXP7cuvD0EUigEUdqKzy1VJYpZj8LKPbvQ1HylryZNQTfXYcion7HB+A9Z2FLJCcTS0SPHWZw38qSvIpNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836365; c=relaxed/simple;
	bh=b0Za19fw+eHquh8yAgvDA4W6/FkCDg7o3v27TiWVqLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/+m3goEnbon2XYTXO5UgRBA2AqaxpM4zG/EaJn9hCstRgPK8updZMex9cQHZew51iHf6S7MkfLFDets2LmODCYyBYREIQhkFSaY8W5qn4Jz9PhwvCudIfn4ium5FNcVM1ZJnudGBgmyaxNfDz6JP8eWs2CoYrIaT95NSYNWn3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ+Tme52; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ+Tme52"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38511175ad3so780272a91.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 06:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836348; x=1788441148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0Za19fw+eHquh8yAgvDA4W6/FkCDg7o3v27TiWVqLA=;
        b=ZZ+Tme52cL8+rgDyh2ivVx5JOatDuDdmOKSqbiwIMC//138eAgfmrkcOaES2UkdfQx
         dqZVit+EUm1OmXatnfIaTZTM8XQS6/gogXZP0b1z6lqRT3Unz8+gJyFSnND5bj6M6iMa
         3zNtGPbdvU7jZ2InP5TE3RWIxnfuufxZk+6ItBZThy23GaZq4a03U+F22xBBCkDxDyCp
         vORPWhMHazfZgHBVj7gsmoYQam94zR8qjU9DMkg38V1jNFFj8GlvfXbCWdHKWT5BPx+9
         zIigYXfrZ6IrcoBEnFyLwvcMheCie6P2M0dx66Enzk6UKjWpkjk15UFZE83qctdL2Xwj
         MXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836348; x=1788441148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0Za19fw+eHquh8yAgvDA4W6/FkCDg7o3v27TiWVqLA=;
        b=sOqswqDZIZxFww44NHJ57z3GSC4GuT1kDjMga1MAacFaR1rmnucQaJ3zKWKo45buSG
         /Yei5xnAkLSNYPUIcxvGOVJqHrPAHLZdAq3HfGIz2a1I65XWYmYgdjzjzn/169JXAY9K
         EXnNzNqjaOIKMojK6IHrGPtgjQo8ZxYjEV8PixzAZgnP9s4+FEbWxDM05p/YrGjD2vc3
         z+AgesQLCDfqM0d0F2cALDiPE4CFCz++oHKGkQHiHnl7JSUOf5FA0+6FIsvpAcwe3KSj
         BJ9OoaQQmynYFicV+/84JqRvffnNshOVzqLRB9Q8E4AgzS3XVTxaPRxDqBb58wc1nfGp
         cYRg==
X-Forwarded-Encrypted: i=1; AHgh+Robd+qI0tuRxvdgsB2n+BfcfLeDC3+NbV/DM+n9uSZBR1idyJvepzhyhu8C6dZdHdzYqU8392ZJrc+GtA==@vger.kernel.org
X-Gm-Message-State: AFuF++krAhia1POCim+6SKp4tLtUZ//37A3s+9L2cQf8S008JGXAOQjU
	5lNCmJ/cCLNtDoYI6UJDXaARfentuw2g/me54Nf9zgJ//5wmy2/Rtb3P
X-Gm-Gg: AR+sD13Z0bn1duIghiVIBpGf0VALcH8yy3y7bCYqlQPzeo4QemUbiU8Y7W+66SBxmXP
	muPhh3NfssAjahStK9yPERNalOZ7S/O5RV52wiyohUGfsmxIWNQZT2A3qXAhAxvI7mJFRVcflTU
	ZZu5ArwBf9eXzU8T9eSHjp4unLQayDOvksst3zdeS4ru6dpK5nlAviWaF0siA4CFw5F3X7ynVXe
	N/XN+XI5Gw100GRAFwcpoI2unfpp7fecXDngEdXogEqamnRySYZDclYIW6tp/ful3EfimVQ17mu
	if+J4+xfNQWfnowEOXScu2h4L3rQL3/861j2RQyUyT5quQ5bcCPl97XzS/IY04am357gcEmmTtR
	NMcZbk9sLN5A0Q1x8L9ohmauoDofBhuWwr0i+p3QXAoY0V4fMLOBTx8RwVOzRRjnm9WkPvgkZ6E
	0x8TIOGZzFDZL7PzRFZDrbIWNIlInYvroqRDg6DxS43WqNp6riM6OTNyazgThpYk9I
X-Received: by 2002:a17:90b:384e:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3966d4232fcmr28605232a91.13.1787836348245;
        Thu, 27 Aug 2026 06:12:28 -0700 (PDT)
Received: from Default ([2409:40f4:100d:ce02:df7d:ac3d:4a05:c45a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm28978904eec.8.2026.08.27.06.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:12:27 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Don't add invalid kcontrols to LED layer
Date: Thu, 27 Aug 2026 18:42:11 +0530
Message-ID: <20260827131211.11946-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827113951.893291-1-tiwai@suse.de>
References: <20260827113951.893291-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 8/27/26 13:39, Takashi Iwai wrote:

>The kcontrol LED state layer tries to track the all associated
>kcontrol elements with naive assumptions that they are readable.
>But one can create a write-only element that has no get callback (even
>a user element can do it), and this may lead to a NULL dereference at
>the call chain of snd_ctl_led_notify(), as found by syzkaller.
>
>For avoiding the Oops, add a sanity check of the kcontrol's info and
>get callbacks, and just skip the invalid kcontrols before assigning
>the kctl to the LED layer.

I don't think a user can attach a device via sysfs without root permissions,
(correct me if I am wrong). I attempted it on my device and got Permission
Denied. But otherwise, seems to be okay.

Thanks,
Jeffin.
