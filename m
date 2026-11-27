Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=134.130.5.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813682;
	b=opeSlpg8ugAUHwjIQqYjNnTha/OjBfFMiIyxjQiHBasz0TuiKr9G+HafItCFiHOL8k3o
	 wjHb7ifdG6T8NVQzAxH7hHtL65rbCitI5ApdtE6oc+wKPyiIQvljUrvu38J0VZcSEQx8s
	 dx/ftjAK9njE+J4uedx7gICZDX1/IONb7Ath/22/Yuk4pL3Ywu3YucvyiwvMNNjMRmzdN
	 gnl3eohZw8A70Yla5N8nKGxT0OUxfhb1sQxYFcyj19vk99/O6hnr2xR7zOp28oOfdMW4e
	 Fn8FXidC7dSfX8IJYzHeMWBnDmCYmqKKQVnjRVBMxwZnXSWmKjh29bDzivqFD6vOyHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813682;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=cLzMwr2Ktbw5RTPLqb6d3LVFoRlhTM7xKoe/sg63L74=;
	b=ysj4/0kLNgf3zhmTfSHpmdAF3yDaxdc6y60Et/iz6LmyBM7wx82D6VQ2RSoyD0QIsrj0
	 B5aYy7CPXA+U9lRllA0jtuhnOTpyQw6GTUbntvhehs6JczFGnaXAyw/Agi5RPDdHO5voC
	 H5UqltMFnchkhB79z/njTEL+p2WOXbBKNLyVbhPwkvlf5cRRO7BdqYycXb+HBVYg/+Z+r
	 RSIu/fzD3d2q3+eOKP4/8hiZnx1C187T1nJq5Vp9fEaGYgzOW6byn9q9+ik+NCTEe1jeY
	 akD1x35gPhd2MBrw6Cjf27fasiCnlhK4jrrswenxczbL3U61c37c24pAczFh2A4Gipg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rwth-aachen.de;
	spf=pass smtp.mailfrom=rwth-aachen.de;
	dkim=pass header.d=rwth-aachen.de header.i=@rwth-aachen.de header.a=rsa-sha256 header.s=20240516-RWTH header.b=pfHPOyoh;
	arc=none smtp.remote-ip=134.130.5.44
Received: from mail-out-1a.itc.rwth-aachen.de (mail-out-1a.itc.rwth-aachen.de [134.130.5.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1547606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 21:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1547606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rwth-aachen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rwth-aachen.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rwth-aachen.de header.i=@rwth-aachen.de header.a=rsa-sha256 header.s=20240516-RWTH header.b=pfHPOyoh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=rwth-aachen.de; i=@rwth-aachen.de; q=dns/txt;
  s=20240516-RWTH; t=1795813681; x=1827349681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cLzMwr2Ktbw5RTPLqb6d3LVFoRlhTM7xKoe/sg63L74=;
  b=pfHPOyohZSc4gLbccgtDlU9CeLaa8vwwuHArRdmCjvx/jIXcZbjQeuzr
   LkSBsmlMsHNT8UbAwOLwLjdGy1H3IMeqO3y+20jvaxFZU+CgPYcOEIQcX
   DljcLdvjAfMGiuPrZiQl63SHSzZ9DRQZxfyFHEy2D9c3v8+HXI1rUTmQk
   rdsm3JoukgYI4UyuK4+pfK4DWiEmt9MeaLiVkZeJfSfBaejLQq9GlaB89
   JtBaxs8MinZIfyHaIBoVBs2Mi2S9Hl8zvd/zultVZ6tuoLcqFKcrwQY1A
   kfzpiM2XY8iStAACUqfhmk3QRf8yhBW3NRBeFOI99vD8v5rTUlRzU/gpb
   Q==;
X-CSE-ConnectionGUID: nteI4KV/Qr27hSHPcErMeQ==
X-CSE-MsgGUID: grJ1MuxJQV6TWWoA/uU++A==
X-IPAS-Result: =?us-ascii?q?A2DcBAC17wlr/5wagoZanl+gJw8BAQEBAQEBAQEIAVEEA?=
 =?us-ascii?q?QGFBQKOIyg4EwECBAMCAwEBAQEBAQEBAQEBAQoBAQYBAQEBAQEGBYEhhglTk?=
 =?us-ascii?q?BMBBTIBRhALGC5WBg6DB4J1vA+BAYUL2T6BdAkBC4E4hXSCbgGFBHaEfjaBV?=
 =?us-ascii?q?USBFYJ7MT6FEIV5BIIigQyQL4hXSAp4eCwBVRMNCgsHBYElQwM1EioVI0sFL?=
 =?us-ascii?q?R2BIzsXER5YGwYFEiAqQENbgRKBA1uBKyZdAQIfRC0VgXYCglGBI10CAUZBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExosCoEaNTwJJgQ7FQxbDAsaBRpHCAILAgxyKBEQE?=
 =?us-ascii?q?x0cJC8FFyY8GweBDCcdGxcOAigGFSELQxgNSBEsNxUZQm4Hl2uCFZd4r240B?=
 =?us-ascii?q?4I5gWuBYAgMgwGcaU2DcQGTcpMPmQikXIQ+AgQCBAUCGYF/gX4zGiSDN1IXA?=
 =?us-ascii?q?g/gX4E1AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:nxMu2qmkNA0tEgdTXEtcZP/o5gyXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXz2HafyIYDfxet4iYYS/8ktXv8KAx98wSVA/rHxjQ1tH+JHPbTi7wuYcHAvPdJGZHBI/h
 yk6QoOdRCzhZiaE/n9BCpC48z8hk/nOGeqkYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArlV
 ena+qUzA3f7nWQrWo4ow/jb8k025a6t4G9wUmEWPJingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gvx4xc3B9q5pa3we0sMT6S6FVDmZq1+AvXKbrBq/0Te445jXBYuQR4/Zwahw7id/
 O5wWamYEm/FCIWRwrhHA0kAe81JFfYuFLfveRBTuCEIpqHMWyOEL/5GVCnaMWCEkwp6KTkmy
 BAWFNwCRhafisPq44z8c/M22cQYDPHgEZk6t0g1mFk1Dd5+KXzCa7/V+d9VzHIv34VHW+zBe
 8pcYDYpYBmojx9nYwxLTstlxKHy2D+mLmMwRFG9/MLb50DMxQht3aKrL9ffd8aiX9pJngORr
 2nG8mK/Dhxy2Nm3k2PVoijy3rGQ9c/9cI0INuSd6+5IuWPN+lMsDzRRSGb44tDs3yZSXPoac
 ST44BEGsakt/U2DVcTmUlu0rRasuh8aRsoVCOon7g2l1KXZ+UCaC3ICQzoHb8Yp3Oc5bTZ2k
 EGU9/vxCCZioJWNRGiQ5vGfv1uaJSkKJG4qfjIfQE0O5NyLnW0opgjQUtZuAOuq15j8Xyvv3
 zDPpSR4i7h7YdM36phXNGvv21qEzqUlhCZsjukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:mPCiS6hrImwUvcBK4yr2rdtZyXBQXucji2hC6mlwRA09TySh/P
 re+cjztCWE6wr5PUtK8+xoV5PsfZqiz+8S3WB8B9uftWrd2FdATrsN0WKK+VSJJ8SUzI9gPM
 lbHJSXL7bLfDpHZf2Q2njdLz4Yq+P3l5xAjN2utktQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AAOq2i2k0qlO91qfz1dI6O6cpEWHXOXvBwVaMAHH?=
 =?us-ascii?q?/MHwzF72uaWeb1blBnvM7zg=3D=3D?=
X-Talos-MUID: 9a23:AvUkoQb3nun/6uBTuCXO3RR/JOVR3fqSN38KuNIbhorHHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,237,1787004000"; 
   d="scan'208";a="218826067"
Received: from rwthex-w1-a.rwth-ad.de ([134.130.26.156])
  by mail-in-1a.itc.rwth-aachen.de with ESMTP; 27 Nov 2026 22:07:53 +0100
Received: from spucky.fritz.box (2003:d1:2f46:e100:e94a:65aa:45d6:d888) by
 rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 22:07:52 +0100
From: Walter Weber <walter.weber@rwth-aachen.de>
To: <tiwai@suse.de>
CC: <linux-sound@vger.kernel.org>, <g@b4.vu>, <perex@perex.cz>,
	<tiwai@suse.com>, <walter.weber@rwth-aachen.de>
Subject: Re: [PATCH] ALSA: usb-audio: Fix Scarlett 8i6 Gen 1 router source numbering
Date: Fri, 27 Nov 2026 22:07:37 +0100
Message-ID: <20261127210737.57307-1-walter.weber@rwth-aachen.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <87h5iiaxrc.wl-tiwai@suse.de>
References: <87h5iiaxrc.wl-tiwai@suse.de>
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
Content-Type: text/plain
X-ClientProxiedBy: rwthex-w4-a.rwth-ad.de (2a00:8a60:1:e500::26:166) To
 rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156)

On Mon, 19 Oct 2026 10:40:55 +0200, Takashi Iwai wrote:
> Applied now.  Thanks.

Thanks! I can't find the commit, though: s8i6_info still has the old
values in all branches of sound.git (including for-linus and
for-next), in linux-next and in Linus' tree. Could it have been
dropped? The original patch still applies cleanly to the current
for-linus; I can resend it if that is easier.

Walter
