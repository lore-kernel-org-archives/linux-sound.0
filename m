Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBFA332EC5
	for <linux-sound@vger.kernel.org>; Sat, 18 Jul 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.14.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784370278; cv=none; b=lJjkVatSks09A+LuA9HK7YeGhcAv50Gl4b2fO8atez7USn8J7UYFqx95WAIEsG0zRrDutMs0A19Fo91a26uhH8owa2bAQoZJTTHmNGp9pjAJ4mP6vGcbEGl4ddEHV5fh8cjx+dE7s7zuvwzE7LG6/BC1rkxFlu8t9XMX+eXaPgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784370278; c=relaxed/simple;
	bh=fIj0ThNKmmXK1Fev2Zo6yKFbDpGCZx8O3IYUuDkYArI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIHGtkL+IQqNqTenyzb9U2IsugRwoBZcwkmJC6dJqyH7cdGqKMqvX3aWjYew4i/jb9pK1s1LXLM5ZYQGIeJKGvpV7wCc0ksz2MxuOzOx3oCRMf8MghrzqUd+f/BCV+hxB+tQK6GLKz7vYHF/BjnffUUmHbPIYxdl84oUDAhw158=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sms-medipool.de; spf=pass smtp.mailfrom=sms-medipool.de; dkim=pass (2048-bit key) header.d=sms-medipool.de header.i=@sms-medipool.de header.b=KmA0/tAd; arc=none smtp.client-ip=178.63.14.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sms-medipool.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sms-medipool.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="KmA0/tAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
	s=mail; t=1784369685;
	bh=fIj0ThNKmmXK1Fev2Zo6yKFbDpGCZx8O3IYUuDkYArI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KmA0/tAdPYduU6FwS913NW/UWa4GYVJuX/CxBcRaWhCAKF7x5l4MJ9dRFNSbvVdGG
	 DzeJQdtN3G8jUR4Ie3avxK52BAyV8ppBRVYpGVYt4eK5p/9vwfGKDzdPBo9V2NLEVL
	 DlbwZRQOfGRFhfMm2dlWKnr3lT1nlr/l9uWGk/YJSZJ7Jt0eXmrsH/ch4XdhXeEP77
	 ah/8nGN+ilFocOVpB2GsM8iO80iJRnNph1H3T4bsJT6CPZXLFM5zg8u2r2atYxomq7
	 8m1iLgTE3s3AW50248YG0TlGlMpopyLBEsr0LD/vKQEHXkb/oOsPJDklkd8Ukz/vdD
	 2USRgCfWpXP3Q==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
	by mail.sms-medipool.de (Postfix) with ESMTPS id 5C31418B67;
	Sat, 18 Jul 2026 12:14:45 +0200 (CEST)
Received: from NUC16-Linux.sb.golima.de ([95.88.98.111])
	by mail.stoss-medica.de (Kerio Connect 10.0.8 patch 2) with ESMTP;
	Sat, 18 Jul 2026 12:14:43 +0200
From: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	peter.ujfalusi@linux.intel.com,
	Uma Shankar <uma.shankar@intel.com>,
	alexander.kaplan@sms-medipool.de
Subject: Re: [PATCH] ALSA: hda: codecs: hdmi: disable keep-alive before audio format change
Date: Sat, 18 Jul 2026 12:14:43 +0200
Message-ID: <20260718101443.2628-1-alexander.kaplan@sms-medipool.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715180610.1371243-1-kai.vehmanen@linux.intel.com>
References: <20260715180610.1371243-1-kai.vehmanen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 15/07/2026 20:06, Kai Vehmanen wrote:
> Add an optional hdmi_ops .prepare hook, called at the start of the
> PCM prepare sequence (before the format and infoframe are touched), and
> implement it for HSW+ to release keep-alive. Keep-alive is then
> re-enabled as before once the new stream has been set up, in the
> setup_stream op.

Hi Kai,

thanks for seeing this one through to the finish line.

I gave the final version another run on the original reproducer setup,
now on 7.2-rc3 (Panther Lake NUC, Synaptics VMM7100 USB-C dongles).
Multichannel keeps working across repeated stereo/5.1/7.1 profile
switches and quick 2ch/6ch cycles, no dropouts, no regressions in
normal desktop use.

One small bonus compared to my earlier tests with the WIP version:
the short display blanking I used to see on channel count
down-transitions is gone on this kernel as well.
That may just as well be the 7.1 to 7.2 jump, but it rounds the
picture off nicely.

Thanks also to Takashi for picking it up so quickly.

Best regards,
Alexander

