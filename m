Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360910942
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 03:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760413531; cv=none; b=iA6eH0SuCXhv2LHmwhA64Z+ZjEuJAnp60oarl809bKIM1B2p0Bf9jSOXx66xVncXL4oPLKMkyV+EVe+zDjP3pzOzkhd2TFGMT1kFQ2843bPPndjcq/ojly9T3jIXBJ6v5+uCIokCSrW+60TU7icODmbjlmX8rNg6Bi7jNx6gc1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760413531; c=relaxed/simple;
	bh=AgkShE7uH96yWUzpH3gSmZSEzMS6r4JBwD5xtKLDn5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsKkqvafoeFhcdABJy15nRLQFJoSOglKuyelo+Eb9r5PUMxOyZhHv73bB6JiIaeLjdOYYcsbX3L09DNBuCjIslvQOk+n8+GPKPY0hQdblrkiRDWr0KO1o7vc7+7SozSM3UCM+Lmk4fgg+zF1OZOly7K4NfTgYEIQySSLUhNFs4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqwDlbiA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqwDlbiA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so45546605e9.0
        for <linux-sound@vger.kernel.org>; Mon, 13 Oct 2025 20:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760413528; x=1761018328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/Zf3gVNNazii8FmNwFvhySg3us0RixLL079KZ3A4LE=;
        b=LqwDlbiA5BZAqnzqkCVzv+oF7oEzWPFuX+XD7xzGXmxcFbLurj1hjihAYMnTIxk+Ez
         n0q+UwyhEJbbFyy0yubK8oA8X5Du1HVXa8eS1rYprhURKeBZRHgyuy9Ry0Rq4VP/xq+D
         9oP1ZDutMV6G07LEqAu9qE2gBgJcDoNKdzdBmZj8TdYXWxILyQSQN1GeZJQI464Hex92
         vUnTYqIS43HyaR5iMm8tNguK6f7iynvCKBnpmRxyrZOj8n8uJRMcd+1iMvEd1aXRJ4j2
         qVgoZJUqHmAu+HIkiYJq4sf4AF9ZkNxqQufoYT+epPoTwqiw/mfAPn2lpxBtV09GN+FW
         WJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760413528; x=1761018328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/Zf3gVNNazii8FmNwFvhySg3us0RixLL079KZ3A4LE=;
        b=gWugOP7eGnA/X4j3GZE0gbwf7mVE6/PWlfNJvGb1K9ZL8372Ziebd5enbQ5nr2eYa3
         is0goPoHV+PiAXxw6qfj8IIXD+7fPZDwJ+91dSX5fMAzwEfRzSw5fcWmRzYVsEzl5hp1
         RfAzm50ssLfoeAAfsKKXv9ZuuGy4YqCTuIlkL3MLcHDJSHG2rIpW2vztHuDPUvHgvRec
         gwRe7psexJnkRN2wDvCGd2jcBvyN4YvPBld1cKCUVw/8gMrO3uVswBMh7Cu2Ymv/m59Q
         W8oCM4laUwhsTBafObh4zgVLGNvTafL5Yl2g6YdjJx1498choMgAbOBIbzmpEaCLYvX3
         FXTA==
X-Forwarded-Encrypted: i=1; AJvYcCW5k7rRl8+eBOAylz+dkbYPKViHHupVdgjivTe7tj65fyFtsqeJi6slT9juEdrHApBH/cdipWd4WuwfFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLTqhAv2pUoWw6eS5QqBLBRrTTuu9ERxS5ESU7gw/sI6QfFKqy
	KTbvILOZa/yBpLpvOrJnpEFJBeh44ZmQ2C/mrrLevjiYrQuS8fhu6rrZ
X-Gm-Gg: ASbGnctbE3ZbMhv8ry1ZoJNKp8flp9tPCYzjqNvr5rY0N60i3FhjnKwBqNz6adME4AD
	IOff6+Z+p37dC1+IdTSZZKGPZgA30ZikGIYcu6IdXY1JAJbvFGE6pGyXTU079iyHuruI4ZgSDvd
	+R+qMrM+ovbIW9eZCsdnajy7oRlUK6AwuUph7++5Xl4Ovm5hzIRKAEIX3MwUExRhx4MpyUNQGxO
	8YfeHjmT3rS3fZ0ol1IcmVmItijde34hTS8QzZk0EvZ6T9OzfXPnHNbtUTjqB9CAKKk7B3Thmnv
	9XCX98FNuwOK2yRMeRuBTF9QvAr6up6nPfHUldYBCaO0HT8bhX0cQi5HpemIsCKdN73fHYv4OHJ
	YzfT4zFkJBLx9gd/yIcEWoELSxLEPEihrTCH1Egx8zRty7E3e
X-Google-Smtp-Source: AGHT+IEggN8xsJVVtmb8jYvbBjF9MhRjz4w96TxR6H4KvnRjXEw65+ufHxe8tiu185JOCLgglHSu5Q==
X-Received: by 2002:a05:600c:3d87:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-46fa9a9ede8mr159772445e9.12.1760413528030;
        Mon, 13 Oct 2025 20:45:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fab3e3520sm150377525e9.2.2025.10.13.20.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 20:45:27 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: tiwai@suse.de
Cc: amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	regressions@lists.linux.dev,
	Dell.Client.Kernel@dell.com
Subject: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
Date: Tue, 14 Oct 2025 06:41:56 +0300
Message-ID: <20251014034156.4480-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250709160434.1859-6-tiwai@suse.de>
References: <20250709160434.1859-6-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Takashi Iwai <tiwai@suse.de>:
> Now HD-audio controller drivers are moved into sound/hda/controllers
> directory as a part of HD-audio code reorganization.  Most of drivers
> are independent from PCI bus, hence it makes more sense to put under
> sound/hda.
> 
> The hda_ prefix is dropped from most of files at moving, as it's
> more or less superfluous.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

This patch broke my laptop's speakers.

My laptop is Dell Precision 7780.

Here is output of "sudo lspci -vvvvv":
https://zerobin.net/?bb0d52d5c33a1ca8#Z4cktfC0ofZhkzBU4/AFGpYAVJFXrus46nDeLQOV22s=
(This output was collected on Linux 6.12.43+deb13-amd64, audio works there.)

My OS is Debian Trixie.

If you need my config, then here is my config I tested with linux-next:
https://zerobin.net/?989789b5698e0afe#DKjA80yFwRFnLkYwo3ZnNZEVGowGyn5N78aSy8omoGY=
It was tested with current linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20251013
(and audio didn't work).

#regzbot introduced: 2d9223d2d64cb5216859ced6cc33fb3b04e5f98f

-- 
Askar Safin
