Received: from outbound.qs.icloud.com (qs-2003j-snip4-2.eps.apple.com [57.103.86.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAFB2FD696
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.86.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293995; cv=none; b=liezLr5QcEIUYBHuMVhzVChF3ueYayOokoyOWR40Hqr8H+iPcg2vNLaelyQzGXNdNvSRXmrtU5DjKuC3FYtztwrQ0Hw09kZnFhBcFpIFmoYjoA5eUMlub/08Py3CebOazB/WLc8Utd/Ze2xV2UN95S4V1Ty1karmjzroMby8YQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293995; c=relaxed/simple;
	bh=pz1LSk+NHZO+/MDxDD2egHtfq3bKoHCp2g2ZCMelh9A=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=s2sROOykX06BkxUM9aaJayYwzTncK8eSUJ7pOZwOwTToEp6x+iIztR2on1Av1C1zyZReI/QTZcp7kfVdSRPFDD5vQp3Hc2Z1yxr0+uUBDNjxNVpa+fRVMgt/72g1Cvfu6Z2JXLkdf/VFWKxgpE7kWoEMmXjwYVw1ynjNIYVNOY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=rKlH+HiN; arc=none smtp.client-ip=57.103.86.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="rKlH+HiN"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-10 (Postfix) with ESMTPS id 506A718000B8;
	Mon, 27 Apr 2026 12:46:29 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQxWB1sZUgNeCEoBTVIPDxRMFVIDWg5aHVwMQAxaDkYwUBtfAkIPHBNWFRMLU1ZWBVQZXQBSA18VTQtSAFIfchlaFFwYU0VRH1RYQQ4KWgJQUR1fAgoERwRbF0YDU0VDAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8ZWhRcGFNFUR9UWF4EU1YONQE5C1R2XAtdfU0DKRpfcEJ8VQtYD1sfR31AdlV1KAQzCkELLV4IXh9MHB0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1777293992; x=1779885992; bh=1JjJX69TRR3VhZD0JKqvCm2eFzxQiSfDhxLHuDIQK80=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=rKlH+HiN19v1nBT4pJgST6+EpSCqv78GhPrm6I43XUZdu0OkuaLRAxB81EaRS8VXOjTmMf9k496M0w2Mi8eWSCniTa4HjW3crFcwbY1vP4cDKYsSUeboik00J3o8GWTLdyiGnDs+SSNMj4pfbB9qMwaDMPQTJg2yZbK+2CIxmBjNxK1qMnOfrJkcgWLZHszVli+UCayZV5BzbepAfvDzukcVSezvqsdRzOgntMB5XV4PtvhYk9jMBNAHYsKAcz8/dgApWvQ34pP8/wO6fxT8bcbWtJZhehMNjg9A3Xhpx9ygYn0gv6e7Z0LLop6AiEAvr74ZulNhmHdFfD42pUdTig==
Received: from smtpclient.apple (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-10 (Postfix) with ESMTPSA id 6B6061800104;
	Mon, 27 Apr 2026 12:46:28 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "M.samet Duman" <dumanmehmetsamet@icloud.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] sound: ua101: fix division by zero at probe
Date: Mon, 27 Apr 2026 15:46:16 +0300
Message-Id: <E8A89A79-D50D-4B2E-8580-7D8E8BC6C398@icloud.com>
References: <20260426111239.103296-1-suunj1331@gmail.com>
Cc: clemens@ladisch.de, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, me@brighamcampbell.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, SeungJu Cheon <suunj1331@gmail.com>
In-Reply-To: <20260426111239.103296-1-suunj1331@gmail.com>
To: SeungJu Cheon <suunj1331@gmail.com>
X-Mailer: iPhone Mail (23D8133)
X-Authority-Info-Out: v=2.4 cv=BqeQAIX5 c=1 sm=1 tr=0 ts=69ef5aa6
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=x7bEGLp0ZPQA:10 a=aRhIMoA-k8UA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=btXWqEsxm-dyBczr72gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfXxT1ISacbIVya
 N2OjFkwEXpKv2DFSCeTr3IRCpPpWie0zxZBsQttKnxDpfTJz4VvkJhhl36BpBotcGyjH0uKjy9N
 1E1XcmHNIGK5VVrf69+yl/dFQbEiGhC9hkfOUUObOrIBPTMi4owIkgQENJxLkd7f/XKwZT7bKy9
 sXSjxVA5BW+1c0wdca3NNzrdS5mpvHDmHZ6ZirGHHXEaBXYlpJvV896Wz5N+Cu+3lgYHCru9Y7Z
 S+m+lcmwMwv2BCNM/phGagQGBkCinMorGmoD+1jORA+CwrorUvxVC1fctOo18ePKAuS2T6YARrI
 k9fZqh0wT+2XiZwNZGy6P7+3pku3ysFuQzMWSVLJrwuwMMCnbPXkVIcjPlnZVs=
X-Proofpoint-GUID: V9u_EDqCM_eQ5VhdUZxvBDDtBWxxeo1u
X-Proofpoint-ORIG-GUID: V9u_EDqCM_eQ5VhdUZxvBDDtBWxxeo1u

This looks reasonable to me.

Samet
> 2026. 4. 26. =EC=98=A4=ED=9B=84 2:13, SeungJu Cheon <suunj1331@gmail.com> =EC=
=9E=91=EC=84=B1:
>=20
> =EF=BB=BFAdd a missing sanity check for bNrChannels in detect_usb_format()=

> to prevent a division by zero in playback_urb_complete() and
> capture_urb_complete().
>=20
> USB core does not validate class-specific descriptor fields such
> as bNrChannels, so drivers must verify them before use. If a
> device provides bNrChannels =3D 0, frame_bytes becomes zero and is
> later used as a divisor in the URB completion handlers, leading
> to a kernel crash.
>=20
> Fixes: 63978ab3e3e9 ("sound: add Edirol UA-101 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> ---
> Testing:
> - dummy_hcd + raw_gadget emulating a UA-101 with bNrChannels=3D0.
>=20
> sound/usb/misc/ua101.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>=20
> diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
> index 49b3dd8d827d..d129b42eb979 100644
> --- a/sound/usb/misc/ua101.c
> +++ b/sound/usb/misc/ua101.c
> @@ -974,6 +974,13 @@ static int detect_usb_format(struct ua101 *ua)
>=20
>    ua->capture.channels =3D fmt_capture->bNrChannels;
>    ua->playback.channels =3D fmt_playback->bNrChannels;
> +    if (!ua->capture.channels || !ua->playback.channels) {
> +        dev_err(&ua->dev->dev,
> +            "invalid channel count: capture %u, playback %u\n",
> +            ua->capture.channels, ua->playback.channels);
> +        return -EINVAL;
> +    }
> +
>    ua->capture.frame_bytes =3D
>        fmt_capture->bSubframeSize * ua->capture.channels;
>    ua->playback.frame_bytes =3D
> --
> 2.52.0
>=20
>=20
