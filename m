Received: from www728.your-server.de (www728.your-server.de [167.235.121.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734DA22689C
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 09:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.121.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553551; cv=none; b=D4CQzGgcS7qx6rrafdW1h/UraR9l/8cEImcp2PAgEQtnEzP5fXQsf1yxCWoUblqLmUf1xnTUsyACZziwFDbaZUnJNk0PtB20uKoAyaxuWCAf0Xj0tJNvVUK7yNzCGfKfIUbgYYPEiiMWLm6hp7L0BPcrSJodQ41sN11W+8ggjvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553551; c=relaxed/simple;
	bh=e2+oeVhG+JKeC2zyG76XCKKupQaY8le+mJ1G0RBwPQE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=c9noS9pGrm7+vj7SkSKRkiUbrRPdB2ns63ygDkgNlYSR2570kr9glBB4NV5jyG8Pk4akgFW8uuaI8reA2uCs2/8HFIMK9DHjKemSPo/Q7CIw0mBTQpbiYdVM3iAba3PPFvyvbscyTz9BFr0z4H+MYsccygVHsnwaUnPh0BtKxv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcogriep.de; spf=pass smtp.mailfrom=marcogriep.de; dkim=pass (2048-bit key) header.d=marcogriep.de header.i=@marcogriep.de header.b=U4dwhs84; arc=none smtp.client-ip=167.235.121.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcogriep.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcogriep.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcogriep.de header.i=@marcogriep.de header.b="U4dwhs84"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=marcogriep.de; s=default2606; h=Content-Type:Subject:From:To:MIME-Version:
	Date:Message-ID:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=e2+oeVhG+JKeC2zyG76XCKKupQaY8le+mJ1G0RBwPQE=; b=U4dwhs84KrXFui6GLoUr84eVIZ
	h3LRThJI48rQlr4HZ1E9jcNUDICxhQBfoxIHlRKRi59H+D8eyCHN4b/OWhHlIgQDyjVAMz3RTDm6l
	LRf3/cgAX8+CumvVWhLqtuybHEYmUuQonfDD1zuGzGCSNTQf90iotp0/AF2KFOWy1qHgpyCs8WPR+
	BI/wZvHYjx6Abq9Lqv1zDomfA6whKPCwGideUmVl4b4l4bvyoDUn1b3ETkCOaanQRtI9HNeSS+RAo
	C66UD1Re1cA16nccPh1kxviNIyh4ifHmJKC6ZdPrx5P2pMVrDHsMnt9N0bcUeiQ74TFcOKzIOgw78
	mp15tQtg==;
Received: from localhost ([127.0.0.1])
	by www728.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <mail@marcogriep.de>)
	id 1wdPbe-00000000B3M-3rCh
	for linux-sound@vger.kernel.org;
	Sat, 27 Jun 2026 11:45:47 +0200
Message-ID: <89f7943a-4262-4a12-901f-187186b4e0ca@marcogriep.de>
Date: Sat, 27 Jun 2026 11:45:25 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org
From: Marco Griep <mail@marcogriep.de>
Subject: [BUG] ASUS Vivobook S16 M3607GA (AMD ACP70 + RT721 SDCA): no internal
 speakers
Autocrypt: addr=mail@marcogriep.de; keydata=
 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
 wTY/4xQ=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Bnp9Qj4LI15j358pZ6ICpKyH"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28044/Sat Jun 27 08:24:28 2026)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Bnp9Qj4LI15j358pZ6ICpKyH
Content-Type: multipart/mixed; boundary="------------fRNSDWzH0FZGgq2DFPHXUVJE";
 protected-headers="v1"
From: Marco Griep <mail@marcogriep.de>
To: linux-sound@vger.kernel.org
Message-ID: <89f7943a-4262-4a12-901f-187186b4e0ca@marcogriep.de>
Subject: [BUG] ASUS Vivobook S16 M3607GA (AMD ACP70 + RT721 SDCA): no internal
 speakers

--------------fRNSDWzH0FZGgq2DFPHXUVJE
Content-Type: multipart/mixed; boundary="------------o050AGklUub4ef2xIPtczib3"

--------------o050AGklUub4ef2xIPtczib3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QVNVUyBWaXZvYm9vayBTMTYgTTM2MDdHQSDigJMgSW50ZXJuYWwgc3BlYWtlcnMgbm90IHdv
cmtpbmcgKEFNRCBBQ1A3MCArIA0KU291bmRXaXJlICsgUlQ3MjEgU0RDQSkNCg0KDQogICAg
U3lzdGVtDQoNCiAgKg0KDQogICAgTGFwdG9wOiBBU1VTIFZpdm9ib29rIFMxNiBNMzYwN0dB
DQoNCiAgKg0KDQogICAgQm9hcmQ6IE0zNjA3R0ENCg0KICAqDQoNCiAgICBEaXN0cmlidXRp
b246IEZlZG9yYSA0NA0KDQogICoNCg0KICAgIEtlcm5lbCB0ZXN0ZWQ6DQoNCiAgICAgIG8N
Cg0KICAgICAgICA2LjE5LngNCg0KICAgICAgbw0KDQogICAgICAgIDcuMC4xMi0yMDEuZmM0
NC54ODZfNjQNCg0KICAqDQoNCiAgICBJbnRlcm5hbCBzcGVha2VyczogKm5vdCB3b3JraW5n
Kg0KDQogICoNCg0KICAgIEhlYWRwaG9uZSBqYWNrOiAqd29ya2luZyoNCg0KICAqDQoNCiAg
ICBCbHVldG9vdGggYXVkaW86ICp3b3JraW5nKg0KDQogICoNCg0KICAgIEhETUkgYXVkaW86
ICp3b3JraW5nKg0KDQoNCiAgICBEZXRlY3RlZCBoYXJkd2FyZQ0KDQpQQ0k6DQoNCnwwMzow
MC4xIEFNRCBSYWRlb24gSERNSSBBdWRpbyAwMzowMC41IEFNRCBBdWRpbyBDb3Byb2Nlc3Nv
ciAoMTAyMjoxNWUyKSB8DQoNCkxvYWRlZCBtb2R1bGVzIGluY2x1ZGU6DQoNCnxzbmRfcGNp
X3BzIHNuZF9zb2ZfYW1kX2FjcDcwIHNvdW5kd2lyZV9hbWQgc25kX3NvY19ydDcyMV9zZGNh
IA0Kc25kX3NvY19hY3BpX2FtZF9zZGNhX3F1aXJrcyB8DQoNClRoZSBSVDcyMSBTRENBIGNv
ZGVjIGRyaXZlciBpcyBsb2FkZWQgY29ycmVjdGx5Lg0KDQoNCiAgICBBQ1BJIC8gZG1lc2cN
Cg0KS2VybmVsIGRldGVjdHMgdGhlIFNvdW5kV2lyZSBTRENBIGZ1bmN0aW9uczoNCg0KfGFj
cGkgZGV2aWNlOjFmOiBTRENBIGZ1bmN0aW9uIFVBSiAodHlwZSA2KSBhY3BpIGRldmljZToy
MDogU0RDQSANCmZ1bmN0aW9uIFNtYXJ0TWljICh0eXBlIDMpIGFjcGkgZGV2aWNlOjIxOiBT
RENBIGZ1bmN0aW9uIFNtYXJ0QW1wICh0eXBlIDEpIHwNCg0KTm8gU291bmRXaXJlL1JUNzIx
IHJlbGF0ZWQgZXJyb3JzIGFyZSByZXBvcnRlZC4NCg0KDQogICAgQUxTQSBzdGF0ZQ0KDQp8
L3Byb2MvYXNvdW5kL2NhcmRzfDoNCg0KfDAgW0dlbmVyaWNdOiBIREEtSW50ZWwgLSBIRC1B
dWRpbyBHZW5lcmljIHwNCg0KfGFwbGF5IC1sfCBvbmx5IHNob3dzIEhETUkgcGxheWJhY2sg
ZGV2aWNlcy4NCg0KTm8gYW5hbG9nIFNvdW5kV2lyZS9BQ1Agc291bmQgY2FyZCBpcyBjcmVh
dGVkLg0KDQoNCiAgICBLZXJuZWwgc291cmNlIGludmVzdGlnYXRpb24NCg0KS2VybmVsIDcu
MiBhbHJlYWR5IGNvbnRhaW5zOg0KDQp8c291bmQvc29jL2FtZC9hY3AvYW1kLWFjcDcwLWFj
cGktbWF0Y2guYyB8DQoNCmluY2x1ZGluZyBtYWNoaW5lIGRlc2NyaXB0aW9ucyBmb3INCg0K
fGFjcDcwX3J0NzIxX29ubHkgYWNwNzBfcnQ3MjFfbDF1MF90YXMyNzgzeDJfbDF1OGIgfA0K
DQphbmQNCg0KfHNvdW5kL3NvYy9hbWQvYWNwL3NvYy1hY3BpLWFtZC1zZGNhLXF1aXJrcy5j
IHwNCg0KSG93ZXZlciwgb24gdGhpcyBwbGF0Zm9ybSBubyBBQ1A3MCBTb3VuZFdpcmUgbWFj
aGluZSBjYXJkIGlzIHJlZ2lzdGVyZWQgDQphbmQgb25seSBIRE1JIGFwcGVhcnMuDQoNCg0K
ICAgIFN1c3BlY3RlZCBpc3N1ZQ0KDQpJdCBhcHBlYXJzIHRoYXQgdGhlIEFTVVMgVml2b2Jv
b2sgUzE2IE0zNjA3R0EgaXMgbWlzc2luZyBhIA0KYm9hcmQtc3BlY2lmaWMgQUNQNzAgU291
bmRXaXJlIG1hY2hpbmUgbWF0Y2ggKG9yIGFub3RoZXIgRE1JL0FDUEkgDQpxdWlyayksIHBy
ZXZlbnRpbmcgdGhlIEFDUDcwIFNvdW5kV2lyZSBjYXJkIGZyb20gYmVpbmcgaW5zdGFudGlh
dGVkIA0KZGVzcGl0ZSBzdWNjZXNzZnVsIGRldGVjdGlvbiBvZjoNCg0KICAqDQoNCiAgICBS
VDcyMSBTRENBIGNvZGVjDQoNCiAgKg0KDQogICAgU0RDQSBTbWFydEFtcA0KDQogICoNCg0K
ICAgIFNEQ0EgU21hcnRNaWMNCg0KQ291bGQgc29tZW9uZSBjb25maXJtIHdoZXRoZXIgdGhp
cyBwbGF0Zm9ybSByZXF1aXJlcyBhIG5ldyBBQ1A3MCBtYWNoaW5lIA0KZGVzY3JpcHRpb24g
b3IgYSBETUkgcXVpcms/DQoNCg0KQmVzdCBSZWdhcmRzDQoNCk1hcmNvIEdyaWVwDQoNCg==

--------------o050AGklUub4ef2xIPtczib3
Content-Type: application/pgp-keys; name="OpenPGP_0xBBD0DC1D980C2402.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBBD0DC1D980C2402.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
wTY/4xQ=3D
=3D2K3C
-----END PGP PUBLIC KEY BLOCK-----

--------------o050AGklUub4ef2xIPtczib3--

--------------fRNSDWzH0FZGgq2DFPHXUVJE--

--------------Bnp9Qj4LI15j358pZ6ICpKyH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEU39sGrfvao/Cz72Xu9DcHZgMJAIFAmo/m7YFAwAAAAAACgkQu9DcHZgMJAIE
xAwAv5UXn7V7KPiiCRKugPDekH2xvd6ng5tL7/ZDU58iNvAMBytpQ2VczAJEaI23hY0Zh9cHHIzO
zfvXw6hk+jQZNvS3hMYih5vF9yNwaEzkPnDGweoDXb0ruk01DjmQY4ggJ1fYpvwQWqSIe0QQ3zz3
bv2sojFwPRkDM9GK9YAcc2WoREWOem5Jn6wBroOhwf20PalBiNf7mK9rvxVRSDlglD/5hIqyaJRF
aAoGShSTI+0ceK4x6VqqmfjPU+UxT4Ku8ULiW3664nO+LX9lV/ip1WnLr/D1YV944AK0fprERlP5
qfc5ETgJVIMmpc96mZzesblAGT1rE6QDbd5QsvlUIjN32vWY6KRl9L1wvgZfVOLLkbsQ/AUpbgTe
itdGsQLqq6XhIDe2W8xp3+4VfYNH7HyZdQl9MqsZ6Yl8E7luzo024rmiFQ+izBwf7Bao22S3VQRy
ibPQ4BQJncKGma7V5dacUm6nAuPIFHXPMFZFO85T2IY0JhkWdzgZTum/YyJa
=rhv9
-----END PGP SIGNATURE-----

--------------Bnp9Qj4LI15j358pZ6ICpKyH--
