Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176275;
	b=HQqUArhxz0PiSgRBCmOTVj9KXSWOfdvMr4aPZMUO6L1/tjC/8cu0YEeVOoYuJGECP51o
	 HUZ5sabu+mY+Nr09ghTslKioM7RJNcWMWUQ7O/7E+j63MOZec3lb+KoVHjMPAFJ8SKbJ/
	 IhxCHt1+49s8yupOsP2ksKP94yuOs399mz8fQ+w2Zq/dnUR/5jsG0pDJ6oGoQGhuw2TGl
	 DMTJjyO7bicgEuVrB2l/H5gyDwEu27BmCFQ4T+Ypwu14NWjym8urJInHKYiqqvZy2voD0
	 XV/M/0GKppyQ1mb1a/GpMzHvTPT9evZB/XykrXxJFw/KNftYb3cLR2vzV18W4aCxkcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176275;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W+H3ZgwXRf3uRNP9Sao2k6J8GvvE+kh8lsRez7kjrbQ=;
	b=XOuMPWoy3BZ+SQhnLkgv9rtpiDELitvRrCOsGODdXYZGGJFmB7uAhoWH6CF6z76/ES14
	 qW6YeCbSUaLUHdeByL/mKNZ1CR/2X7rrhZH2D1aPubp6lyWYxl0dOWNNnr0wZx2N7RlVh
	 iT/mYd3ut/msAfRp9T+Q4vFOfj5UtT3X8tkPuCjqaVV1TeYUyUcLtta5mGsgDCpIBbTxi
	 DnI61DxY52xvBwuU6m3/rORCVQu5JEfIKcLEMCwwDfsW8+qmPAzy/rzAmcIPSaRQqyMwX
	 GQowj2JSq72ibPaJxWxgSexaVV2XFCZnrr0FA+l9koL1663tIn7AgKCYx3vYbEFrG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kode54.net;
	spf=pass smtp.mailfrom=kode54.net;
	dkim=pass header.d=kode54.net header.i=@kode54.net header.a=rsa-sha256 header.s=fm3 header.b=oXJE79cN;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="Yq9/JIaj";
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CC0606A33C
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 12:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CC0606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kode54.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kode54.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kode54.net header.i=@kode54.net header.a=rsa-sha256 header.s=fm3 header.b=oXJE79cN;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Yq9/JIaj
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 0257BEC09D1
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 07:04:34 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 20 Nov 2026 07:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1795176273; x=1795262673; bh=W+H3ZgwXRf3uRNP9Sao2k
	6J8GvvE+kh8lsRez7kjrbQ=; b=oXJE79cNf6Hsut8sx/6vJWy+DfxOWk3fg652A
	zae5ohfdsY8PFrmanC8TxXGmj1siTxWrP9k0zq4igyTE6FkPDs1HLIDPE0B3SETN
	G2TTyF0muvXZY6ZJzUUfZMANBFQTE9N9UwaLzRvrfsq45fG5H6m5CFC5k7G11FdU
	l7Hpt6MRqOHYSPJQxGUzL02UUagR/gpptOM3wmb/TskQHzqIUHYWlZuiOINxAcWK
	jqSwPvteQwMl22zVRxsjZXyM9TR/ehX9p/JSMdYJyYKKH0OmGy7an2Fv2t5hO8XX
	gpZNIDlbCjHMZY9swvQEQhJGRN1tDrG2X+MIQN/1Twzq310Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795176273; x=1795262673; bh=W+H3ZgwXRf3uRNP9Sao2k6J8GvvE+kh8lsR
	ez7kjrbQ=; b=Yq9/JIajrw83X2WSksArbZ19sEM0Ogbc77EapoBakWzgJ40BGM8
	aopdZR7/rLFKQANHTjuhT9ZYr3XBYRCQ1OMmEF4RE/V1N1v8di2Jx4HrezWHARNt
	ynpKgGfIqgbquSwoa8J2shkqHHL+nmaX8Rf7gkHGSpxM8KPOquEco/aqbY1kr+HR
	lD31oQ3/nzn/wo2p+ZHyiaRt3Ll+i6nEORlPAH7wM9wACoE5Bl9vrnItmRZjmW3e
	U3CFYv7o967vQCAtB4zOlLaYiik+kqX4g4IHf/rRt7o4c3faVpq+PHdGyeBqClY9
	w9ORWkeNYzsWDk3kEDUBtKq5VlknUVxbkIw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kode54.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795176273; d=kode54.net;
	mf=PGNocmlzQGtvZGU1NC5uZXQ+;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:S5tF4VTgVeONGT2gw20Ycp1efACTMbOYm1YHd5+Yg0NtcH8
	kV0kYP5XxNUnOt0O0wfvfJAo69CCxiOjdcAk4F77sBS8YUZNkpYJhyfYftbTd7KY
	OVVgEkmYY6U3EK9+c2Uhzx/Jqul+dzNuDlcWXOgmLzCMvqKFRqV5TkYl8K/sal+G
	ARgtOW0jADaElQ1KoG6HMGPoAsbwCoqc1tDv95jgTOZM4wy+VGgj8EQ0syRD8ccv
	/PMPBPWkxqQ+ZRsrgZ+PRhWYhFW7fIBV44UKGXE0OD+Fr5P/I4TKg2UkybWAVLm6
	6fVUJB5fnZrFfbErWfu4UNolAsPDY4XQPqCxAyw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:7f5JvrCyyfIj42IC9CMRwjOPfNQ2x+DOCGRSM6nymkg=:CGQ+xCpDJLwH/GY6i3EAx/RyFdm100D0fEFf+ftdEUw=;
X-ME-Sender: <xms:UTcAa1k4shN0XPzbyzDISsP01a4OOP3itHE7GrVaWhNiXFRPnorEpQ>
    <xme:UTcAaxhiPTCIeOUj4H-PyTY_sqwXx6BaqVmlsC8clYPDBid4PdcplFf3zfecKFzkG
    AXTQZYdV4UmDHa6GeLomGzq_XgELab1_TV0-HuF5QjP71tfvS6S-vg>
X-ME-Received: <xmr:UTcAa50oGTbzSpk4TNycbH9Zo5hcLNg5DY8BtsJXzn_9kPpxEPjrcoISh7Q>
X-ME-Proxy-Cause: dmFkZTGW7ioBdtv7wnzDBQK/fEyd4fv5lhnt/d7TOogTZlX/GOXgDKVzeAkjBBOrEv9dNS
    3WuN2xQsgZM5fFFnTyn34AbFdDMKTMpKbQbfmQPUnMMXRgbUPIuijen24FQIyNn3SUFb4v
    6LZkE2A6eOWjpPZbK1/DxxVXsckNet5C5lGo4jzbzmYsg7mfRWLcwWFOC7YUdPicK121dI
    BsLMvvIsp0FXPOaQN3vVqfT2iWgIiM8ieWlTTtZsSnudMIBRJwYFP+qIlg0iV6793eR+JD
    060z8l7oHHBWQ3mp2jT5Sm+fAM68Yi0Z5bNyKCCCkWzykRbJVCKzzyf/y7kmDyrcjVAfK7
    +/pCa95xwzgOyCWG7ncB5b84LXd+4rBxDpdBXQDf6UkYtjWezLMEve7mt9eMAzWP1fK1Ir
    TAklqfwPE++lQkKK5RR/KCshZHgRKQ8OD4FzjQ/eTRtGckI8YDW6431stYoo8ItScShoKz
    YYf1rVwRpX/aks47+yvFQG0O5bGTEz2Iy/7VqNusf3ygn6/v+5N71B3qJsLWsJ14FZHm3W
    krRpJpfdB2aLZJPASgY3LNOmlE0Nv1wZ3jCyTt2jH1Ebvi6x9IQ2/8LfDd6TIZP+/ZATFj
    k37O/TQIqjQi3tQ7hgBQ95x6leAe19mvxz5I4iv+jDttMdRjVOe+W7HbqpAA
X-ME-Proxy: <xmx:UTcAa6K4PIzz9Yk-uiASAOTNVOZRleDoZVfiiplfkMN4NiZuop1dLg>
    <xmx:UTcAa5yE7mgJc6_UhZtc1Nr7AjlMrF4PHBSRysHhkBSgPmFkrliyBg>
    <xmx:UTcAa4WZ6w4rGKk_n3DhUOaEbdwRp_JoERql4oV-woXtRgG0xDQKsA>
    <xmx:UTcAa5iZZnYbmD5Wryl-bixgIVQUUM8S_jLMKd2dO1iwSJjY9y9yEA>
    <xmx:UTcAa3GBYdZFQu8kQFbTyEN4AD5Trqo9nM2fFlZ02cseLm6YrHvkqJ86>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 07:04:32 -0500 (EST)
From: chris@kode54.net
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Christopher Snowhill <chris@kode54.net>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Rong Zhang <i@rong.moe>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ALSA: usb-audio: quirk_flags parsing fix and Logitech PRO X 2 LIGHTSPEED quirk
Date: Fri, 20 Nov 2026 04:03:46 -0800
Message-ID: <20261120120356.10909-1-chris@kode54.net>
X-Mailer: git-send-email 2.56.0
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

Patch 1 fixes parsing of flag names written to the quirk_flags module
parameter with a trailing newline, as echo produces.

Patch 2 adds quirk flags for the Logitech PRO X 2 LIGHTSPEED receiver
(046d:0af7). This is a mitigation, not a fix. After a hotplug the
receiver firmware resets itself on the first stream open, and also on
repeated GET_STATUS requests or on SET_CONFIGURATION shortly after a
port reset. It only behaves once it has gone through such a reset of
its own. The flags avoid the worse failure, where the probe-time
interface setup wedges the receiver for about 77 seconds.

The same receiver hotplugs without trouble on Windows and macOS. A
USBPcap capture of a Windows hotplug, with G HUB installed, shows no
missing request that made a difference when I tried it. Replaying
G HUB's initial HID reports before the audio driver binds did not
help, and neither did a host port reset. These differences were not
isolated:
- Windows never sends GET_STATUS.
- It sets the playback alt setting once, about 0.9 s after
  configuration, and keeps it.
- It only reads the volume controls at probe.
Suggestions on how to narrow this down, or on whether the quirk should
be expressed differently, are welcome. Captures and logs are available.

The device entry repeats CTL_MSG_DELAY_1M from the Logitech vendor
entry, as the other Logitech device entries do, because a device entry
replaces the vendor match. The receiver also worked with only
SKIP_IFACE_SETUP | IFACE_DELAY. The PRO X Wireless (046d:0aba) entry
does not carry the delay; Rong, I'm not sure whether that was intended.

Testing: with both patches applied, sound/usb/ builds without warnings
with W=1 and checkpatch --strict is clean. Patch 2 was runtime-tested on
a 7.3.5 stable kernel. Cold hotplugs on a front-panel (PROM21) port and
a rear (CPU xHCI, behind a hub) port recover within half a second and
then play normally.
Patch 1 was runtime-tested on the same kernel. Flag names written with
a plain echo are applied, and an empty echo is ignored by the parser.
The sysfs readback still shows the newline as written, because the
parameter stores the raw string. That is cosmetic and left unchanged.

Assisted-by: AI

Christopher Snowhill (2):
  ALSA: usb-audio: Ignore trailing whitespace in quirk_flags
  ALSA: usb-audio: Add quirk flags for Logitech PRO X 2 LIGHTSPEED

 sound/usb/quirks.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.56.0

