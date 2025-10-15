Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27E13064A1
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542271; cv=none; b=Ve/hakbf8pObhM/EU+LMcjqC4geEByL9KF/hPtee3cPrs1uUkvF4EEOFb8H/rVerqvM/6W+pA4Wpt7mb8U2boeieeu9STIV7N5jgKCeykXMm4ODZuxu+v3AAGP776Kn64dNSc3Ezr79+74ypY75n8E1WBZb8oE6aM/4yfNOMxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542271; c=relaxed/simple;
	bh=foD40p6XypQF55AZf958SGpSj0LdAkadXOkKkvaIIro=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc; b=i58O1yzizjiyZROw+l5TkH1csKs30EG1iIE+1lgL+N+DbdMg3JldSj/Qe9JvWKcxvQ8aX2sLNWXtu8Dj1M+a6D9lRXD0AMb7LvV88oNIFohTawgeGF9IvlrcmJebtLNFNHTELYsMSi+/o4gd2rvoZdshgWj4AO3rpGb29NQA8UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=CjahYkpC; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="CjahYkpC"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1760542263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=phiaHrkuHX1+QSJO+QQJsBVlliCLRCFSYHUsw0Fujng=;
	b=CjahYkpCEkovwyh+HON1KkwQNpcOcPIs33rtsHWogAbhBZYwqO7oGBDoxAuzh0uoO5pyFH
	8zhv3I0NZWVu6JOJ10Dp2ZFhn1FFSzRTMJ5mxKVS5LlSlC4Oap7f7CQjlq02nzsaBrPN4z
	wPAqg4D4x+KFa+D1eOH1pIIXLHcfpOidttLi+gYgDLtRUCVKqUpvgQMBhMBtmBS+jmmWaY
	P2w9IPnGCtQQhlOcVssUueHt1dsYuCFkKAD1e7jA9gyC2EsD5zENRZPK12s6aR0JGJirkl
	sKsK+2CeV1tIQbgzMfbJ9Uay1wIC9LkKdvRD9YY6G3qpk+XLUpssimjvS5jb7g==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Oct 2025 17:30:53 +0200
Message-Id: <DDJ05640974K.3G1TLY1B75G7@cknow-tech.com>
Subject: Endless spam in dmesg: ASoC error (-19): at snd_soc_dai_prepare()
 on i2s-hifi
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <linux-sound@vger.kernel.org>
Cc: <linux-rockchip@lists.infradead.org>
X-Migadu-Flow: FLOW_OUT

Hi,

On several of my Rockchip based devices I get ASoC errors, where the one
from the subject occurs the most, but there are others as well.
While it should ofc be reported when an error occurs, the volume was
bad, then really bad and now it's just absurd:

root@rock5b:~# dmesg | grep -c "ASoC error (-19): at snd_soc_dai_prepare"
983

If 'dmesg' buffer can hold 1000 lines, then I have 17 of these as well:
hdmi-audio-codec hdmi-audio-codec.8.auto: HDMI: Unknown ELD version 0

This means that after just a few minutes, 'dmesg' has now become utterly
useless as it ONLY contains these errors/lines.

Booting into older kernels didn't seem to have an effect. If it had, I
could start to bisect it. I have no idea where it comes from.
So now I have removed pipewire ... and everything that depends on it ...
of which 'mpv' is the most important to me.
Now those errors are actually gone. And dmesg actually useful again.

So I guess it's triggered by (a change in) pipewire, but still the
kernel should not be generating endless copies of the same error. Once
or twice should be enough.

Can something be done about this?

Cheers,
  Diederik
