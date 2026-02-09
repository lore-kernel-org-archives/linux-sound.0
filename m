Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C9D220F2D
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 18:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662514; cv=none; b=ODiWG4sjFM+dr+nwNt6+5RgC9kMNbebWP7Fb1uAP0rII8fWD6CIXkXmzNxr2ihP9hB/FAK+fH5tlfxN5HOVZqR1P+GYht2C42FXV9ZiLwmiMIpNP/rIQl0RMQPzRPKgumfk6ZVKBXgPN8vuY235ApxL1ePwz29oOdvswh0zKYhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662514; c=relaxed/simple;
	bh=bjJrUdCNeITLRzU1GlVIkF82uIzPV6HSDm80KzYdtd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLs8GNcacf+Qj1cQUgha6ndiFRqVAAZLwyECLWvaiYFzgKEqJDUj0QDhgtjpUCjFYbQh0hPyYmFVvFHm4E1jCmYAKgX63HZkvFij3S2EKq7xLivo5ov4ZUjeo6llrBc+SL7iNlcWhjyAMTCkgdkXgYk3ZJKOTPGRfq/EjK5dn/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gS9NnHwM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gS9NnHwM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65940221f7eso7989752a12.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Feb 2026 10:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770662512; x=1771267312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOzL8QoO0fxNZIvWKQcBUBe+PXUuwRP65f/l1DdjiAY=;
        b=gS9NnHwMG4+9iZCPaYrqsHvgDMZ4/uTgsP+4VwgZ6mhwf2Dkac0zhxLHybkbC1UaF7
         lI1WvSRmrI3JTEib5h7+ocLPByXS30sf5xW/Kl0wofKjZCeY3ndYp6NjpJpGGF8VUegF
         MRPCx0OjHIQnEMMBOnr1ndwKrKyTD+Z1vrSuP0dzUYhhBqXoMmazfSirw0AwSalRf1ab
         KycDJouROM9dTi4eu7O37ssgtCZjorreDlFlBhyKbYJrubHiJNLtcYS4LjGTlp89+xDf
         YKfSD1jXHF3WdNd/q7tkC+Stl087IyFrHM076X8slDuVB6vbWyYc5ayK+IdTaa4ezQzK
         DppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770662512; x=1771267312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HOzL8QoO0fxNZIvWKQcBUBe+PXUuwRP65f/l1DdjiAY=;
        b=Ee97PMdxq4iSN99xo8YieBaBS1UnoQPbXA/3vn4XGK6jwNHvN+YrUZHFv3lqycpqge
         /s6Y+IymXhtI4HLCbuZp/tauqIaUAhVsUVbwGBl6iQsYELHXXDsXU7vaRNUGcZnR0Ksi
         fP1Ei8Y/RV0wfefi0R6Ik9sfuwwi/ng9bPQ9DJvq/kWJrmhZ5sE/0Mz0l9Smfwi3P95l
         e3H/apSGz8GmGElYe9IVAHJ62r5SRa+cJp65DjzF5qgDW42eTF7/GIBEkp2zxDb6kqo+
         s6/2gjQ6RIdBbtjwwJUp30wcajsrT5e9KGCGUMTpD0NneVPnpOI0H1Tz3LWFMiD27jqR
         nV3w==
X-Forwarded-Encrypted: i=1; AJvYcCWzYTt+tWat4L1NhV1Z3KcfZBhFlOUn+dVgPsLQ75aU6/RHI5dX4hyY7fdQqJo7wA1cCu+Jwk473R4OLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6WHPv3+7OEYXIc2PN7dsuPHISp7q3vEth64LQtGv9ePAlZ0Ma
	Xp2ClX/vd9aN2OJL/WKuHf66APGlnmK8K5RA++IHUoRIUjbMBSIGXq7o
X-Gm-Gg: AZuq6aL3N8G2G0Ydmi+e/+CGiZK9NnCTPzTkYJyynSJDNjjugRRS8vbPSqaGU6SwKci
	SW8cuSLWTjAlk/U9NyDr6VASEWLNzM+cOXd78kaZDBwmm1NdM7TTQR4Ku1FxU8zLGsp7JIbEuUi
	Bx1GUOdyvZkG6IbJsVaCDLtTfg6IpTDbLB7vvqoBGOFLhYFF3dIr0uzm+j5iphNzL2kjIoI65fB
	66DgJt7qwBxBDBwELtUjXwqKY8PBz0+BkvApP92aJOAy+eMfnMu0KnqPpAeCVxZ5+JesU9CDvzc
	b5DXjenTToDwPQJ1QOAoEppRjzWbSFkcMaKTwQKF19iMmtqJ1PHVBNpo4NERYN45FzFFLXGBRU9
	FZM+66N29+j0XdfJMdjBuLdOwb40eyru0LwKFB0BdqXgIk5a+4QyqGaJEkgAvYMeqfilq8TURtV
	GbhgpkhKgekBx5vktI+e3IYPOlFBE8m6hFqLf1
X-Received: by 2002:a17:907:3f0b:b0:b87:1eaf:377c with SMTP id a640c23a62f3a-b8edf30bba6mr732256466b.38.1770662512189;
        Mon, 09 Feb 2026 10:41:52 -0800 (PST)
Received: from Andrzej.rolna3517.home (d176-77.icpnet.pl. [109.173.176.77])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7dd3acsm422356766b.28.2026.02.09.10.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 10:41:51 -0800 (PST)
From: Daniel Kamil Kozar <dkk089@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Daniel Kamil Kozar <dkk089@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC] Fix speaker/mic mute LEDs on HP OmniBook 7 AI 14-fr0220nw
Date: Mon,  9 Feb 2026 19:41:20 +0100
Message-ID: <20260209184120.12279-1-dkk089@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87fr7a2ri4.wl-tiwai@suse.de>
References: 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> I don't think we need an extra macro for those rare cases.=0D
> The problem of ASUS ROG Strix G17 was that we don't know details about=0D
> TX300.  Otherwise we could use HDA_CODEC_QUIRK().=0D
=0D
Alright. The condition to use in the Asus case is simpler as the quirk is=0D
unique to that particular model, seems like the OmniBook is going to need a=
=0D
check for the PCI SSID and perhaps the codec's vendor_id (if the Agusta doe=
sn't=0D
use ALC245) or something else entirely.=0D
=0D
> Also, in your case, we should check rather the configuration=0D
> of the existing HP Agusta, too; I guess you blindly assumed that it's=0D
> with a different codec?  If it were the very same codec chip, your=0D
> change would break another.=0D
=0D
You're right, I didn't think of that, just assumed that it's ALC287 because=
=0D
the quirk it uses is named ALC287_FIXUP_CS35L41_I2C_2.=0D
=0D
Thanks,=0D
Daniel=0D
