Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404484;
	b=WL4AVFwzosmlaZ7n6435RtfU1vTQ9ucFUMT4RyRKwoJ2I5UEgiou1xotMlFt89+d8PYR
	 XTs2b8BTI52kKLE8K1VSDZQMvh7OlEzxNld6RyR5C0FIUh4ARXgANUz96aSivyi0iC/AJ
	 V8csvaVSgvE32hD9hN7DjbuGe7hLwvAKrDJl5F+lDQEwIht6b8TJaO+JdzD9itTVrnmrG
	 G7mIDOLtAK6WxDoiz5H6dgR5YyTQUk9ZAubTD97p1f0okGfXROvkEUgLdDFZiAgUX0QyI
	 0NfLy+rqEpF8dJ5tzxI/U87Ib44EbrqgP/nqWrQvd78iIJveVTK+HskfCaP8qfg8ukQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404484;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TGfp7P5OBJUKiThiruIwJr4YVVahruavoJqGO1SNK8U=;
	b=D8GF0U9+0W6Kur4U13F2QS8BVoIDil6m4sMFBfXJ058sIfpo0IB4GHAE8cEAMLuekQdl
	 unMDJ26gQt8kqjFdJ4R3w70X0sCqN32lQ1MJOPWJ6ZxlchipjlLz4OfSn8fjrN0qsJI3e
	 friO7lAHP4TwAYSdN3Jnu5jAcCcTUKpKYam8iyzjYvNKnGadZ3PChFjTpTpghdVXCUzoP
	 dLROb7khPfDzHdoOLLF8hlCSL7DhsQxS86T0nJDWTk+3nIwfGGPuNt3cqshX5JAwwU0YX
	 x6x3rUkYKOWsbpvYrokLyUfYUX/WwLK/f5TVnnE7LwiXluyV9K4MD/yiG9rXV0AFoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=DScxZSda;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96FE606A32C;
	Mon, 23 Nov 2026 03:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C96FE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=DScxZSda
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=DScxZSdazFS7PwahgzQqGpB/4MD+YYIL03yNpJ1gAV+xzkymx4hQjavd+KC8VOLi/RWtcWRWlOvSc
	 Xoa7BJDuW49VKKoj2dkMAzsxjyYNb0rkvi9QJ3/cRCQN9ewXTuAEXVvJG0e2xcUa8zjQHQ2mfHllDn
	 r90KuvjBEVnLqerw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b03b2c003b-054b7;
	Mon, 23 Nov 2026 11:28:00 +0800 (CST)
X-RM-TRANSID:2ee66b03b2c003b-054b7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b03b2be876-84f5d;
	Mon, 23 Nov 2026 11:28:00 +0800 (CST)
X-RM-TRANSID:2ee26b03b2be876-84f5d
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: aoa: size the codec reference property name buffer
Date: Mon, 23 Nov 2026 11:27:58 +0800
Message-ID: <20261123032758.855-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <87cxs5ypv9.wl-tiwai@suse.de>
References: <87cxs5ypv9.wl-tiwai@suse.de>
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

Hi Takashi,

You are right, there is no truncation with the codecs that exist in the
tree.  codec->name is only ever set from a fixed string:

  sound/aoa/codecs/onyx.c:1005     strscpy(onyx->codec.name, "onyx");
  sound/aoa/codecs/tas.c:860       strscpy(tas->codec.name, "tas");
  sound/aoa/codecs/toonie.c:129    strscpy(toonie->codec.name, "toonie");

so the longest property name built by check_codec() is
"platform-toonie-codec-ref", 25 bytes including the terminator, which
fits in the existing 32 byte array.  The W=1 warning is a false positive:
the compiler cannot bound the length of codec->name.

I will drop the patch.

Thanks,
Aibing Chen


