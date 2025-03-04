Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF743209F5D
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741117170; cv=none; b=Add3l7Am5vxnyxIEcWtz5qN2RuJDBHh6NageNons8aajDXN5GuPrr2srvsjIscafPuSvGyuVdoR9mcR3wzCM+Kiy3u70Wqw0xI4Nwoax6fM7NcDmm0LKkXTl2aT1BXn0YFyWCvhv7Gc55iS5VFrSJvEi7NfiVrYu1Y1zZ9IMhCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741117170; c=relaxed/simple;
	bh=qoCqiZJinqXdDtiY3s95mYhIc7mRPvNkWLcbRHF1k70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=abNAAQZDa6Bkdo0xcNubSMLql9s7CJM3Rlotwa3cFPWJLkaO5PxdgMoxG+mXJID7jh21pqYwxakiUHj275c++2qZVZ/i0nWyiXjCx9ozPToKyqsHlMaymPdxBM3bZEIUTsWj6h/P8VteNaOa32rjNv3VaF4739GQKCoAcmYhzFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=UwiwFcqa; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="UwiwFcqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741117159; x=1741721959; i=wahrenst@gmx.net;
	bh=+PVDCSaWd7kj6AUbyv1/Qq32zBkkvCXfE2mJfsi7wrs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UwiwFcqa4YdIBufj+ufNyA/IXuLssKu2HV3FKGMyUjYVWeHrlJR3VWl0Gk2Ryyer
	 ol9phspdCMsjEDc+Kp+OS7zCbTw99Q6MX20sxnvBTXzY7YWU0LJFWnhpNHw2ouGby
	 lEt0T3fQzxgv8aSsQMRbxKv3pJK3+MygahD+YuIrR78uL0N4G1uxPttqSPm8D7f4R
	 uNRcH7ptfPXr88MxmXHTPqmf/2JbCjOW5T1G0fV7L5ek1Lz9NBSCLaG1hbNBVnip2
	 7MOnKE0Xj1dwSBKuLkYexOYX1gqP8QR5UwwbCnasnimwoLJNS9+pMoaKGQ80ar2Sf
	 eLvyS5jqItp6rb3ucg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59C2-1toRe71588-00GgkX; Tue, 04
 Mar 2025 20:39:19 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Turner <david.turner@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	kernel-list@raspberrypi.com,
	linux-sound@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 1/2] drm/vc4: hdmi: Call HDMI hotplug helper on disconnect
Date: Tue,  4 Mar 2025 20:39:11 +0100
Message-Id: <20250304193912.5696-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304193912.5696-1-wahrenst@gmx.net>
References: <20250304193912.5696-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RjemSbaKMcCEugHtgOSazUH8ZnN5EEJ+J5iWJvUZxT8gBhx38Tl
 MJ2LBdXiyt3mk3ivdWslL6Bdeo02Jt7nnXIyVRmFXHxAz0ym8Av4osOif8aREtArWieRlJy
 QKiG1sPFGUkuqPH7iQz+42fOJGJCUNfZarQvACsy6bNfbdG2/IRufEd8XdlnqdrH98E9aYI
 +ZqqGIyxkBE6LDT7cXomw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NyjvVYs8GTE=;EFjuLDw1YWym+TIlVE1skGGGNV4
 /Dst/aqgc9Z+7dYUA2bsbu7Aue3LmjaboNzNLa6AGqrHUR+1CIKz9U1IQRP397dxoFmKKfxSh
 gv+MYLjNO/L0nUdCkOfj7THMb2TvzmX50mMWncc1+ZXiLGYajT4Wka9ixRzZ2D+TZBx999+UO
 dOxjcqx50X+Kp+5d5fPK+s4aTZtdzlLRwIyR7XPXfMsyfaJwKTD93GymiBIaL7zZKQXjFv+Tw
 4uKHdTWWhLPvOq55qs1JTKgho5yjzSjiNNT6Je2ylKscH/FVaKnvbrQB8y0KaSFRMNLsCb1vE
 m/Tg1zG6D6QJ8mkrXbimmtrmC5/QxiK+aCHnvcRKH+xcqVE4vzazJX36jcmYWy5OJHY/n4lS1
 oZE6T0mYG23m9rIvwr4a1Qt0z7C4A3GWoM9hbpeSeL8RSSTNvbxyYMY3NTJYdbP+oU/CjDZyC
 kV45WNxjtocsjffCtk0FJZAK1omG2i+iJvTl6FSiYj6Jsfpu/V2ylcNk2eFeGwLDgb+KN8h78
 qKfK19J+C2v5tjmIKk5l8fXLG8kpS1TQSoCUJS03kr6q+SGpU0zskNwxo/ZyJFvi8cO5XjobT
 Tcs9qrjmQDGUW3Tn4BHG7VD6GC4H19/MZ8m96qdIHI2Bo7zZ60GT7YYO35Uffh22Ygd3FWVcI
 qLfhaeZELovI+bAAgNHxKqIhNW+WY/4cK6NntnBy0vRPZwwRp/hjY9Zir/bjakxOBh4VW3ncF
 mYHZ9xVRwHvlRSnSSMG3CdZeDLR1On1zS0vruT7ZBFIHeHjZ8zB0p3eY+e5lwzT5RNL2tcWxt
 XgYvs8zyptXUYQvP0gEROO8Iw9KYl2GjMk/N1fCG/EARJDRoYm2ZIv6zIbFOYmnEIipSOcoIQ
 DWqClYxLjqXVzU5jIR4fLH8vIALq/QJBWvkzcUbPCAuOgu+Nl3V7Rr8g7+rEkpjexB4WFuXUf
 uK/+yes+Tt9iSz+fTgiwU88p7nVxPb6sSDI6JU90U1Xkk5b8eBLqOtF33++nBp4g2vQRX3vhD
 MyT4aZRVPwmAVrnxfDYl7N/SFNRB5QjOvKDourQI7B7cK2qWToRCPjzusGzel86Dm3OoL5OUJ
 k4r0GabkkGKtdQVArKYBc6r9XapTELai+6jiAOTkAftgOYQVxlQX9+rl15VzzrsySFpqpaF1h
 pnnisBtDMnadQM5/Y/IHGNfaogkmfdHphReiRuzTh+OkvKfUq7iS+y7J8dmLizOYN89bYKqbq
 1JIkWvByGHNt0y7nUQqe7fRNwFETx7hhHKthCyKmYcrUGFtbBJ8kx7tXmHhHBZoKSjC5XX80i
 N5E6SPWn2rE2n2IsegnocqPIBP5M9BqD6XAeD+e0KJiRvyQVVq7j1bom4oiL7/ydQ20bbtRUi
 M58UqxPit54oP29QmXvHofXRX4ChuaY73teeUeRZ5EGWAa0IpvuBDsTnhw

drm_atomic_helper_connector_hdmi_hotplug() must be called
regardless of the connection status, otherwise the HDMI audio
disconnect event won't be notified.

Fixes: 2ea9ec5d2c20 ("drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_=
hotplug()")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi=
.c
index 47d9ada98430..e4b027616d04 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -400,13 +400,13 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi =
*vc4_hdmi,
 	 * the lock for now.
 	 */

+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 	if (status =3D=3D connector_status_disconnected) {
 		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 		return;
 	}

-	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
-
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);

=2D-
2.34.1

